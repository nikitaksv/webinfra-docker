module Additionals
  module Patches
    module IssuePatch
      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          alias_method :editable_without_additionals?, :editable?
          alias_method :editable?, :editable_with_additionals?
          # TODO: working on issues of dependencies (aroud 20 redmine tests failed with it)
          # validate :validate_change_on_closed
          validate :validate_open_sub_issues
          validate :validate_current_user_status
          before_validation :auto_assigned_to
          before_save :change_status_with_assigned_to_change,
                      :autowatch_involved

          safe_attributes 'author_id',
                          if: proc { |issue, user|
                            issue.new_record? && user.allowed_to?(:change_new_issue_author, issue.project) ||
                              issue.persisted? && user.allowed_to?(:edit_issue_author, issue.project)
                          }
        end
      end

      # Instance methods with helper functions
      module InstanceMethods
        def add_autowatcher(watcher)
          return if watcher.nil? ||
                    !watcher.is_a?(User) ||
                    watcher.anonymous? ||
                    !watcher.active? ||
                    watched_by?(watcher)
          add_watcher(watcher)
        end

        def autowatch_involved
          return unless Additionals.setting?(:issue_autowatch_involved) &&
                        User.current.pref.autowatch_involved_issue

          add_autowatcher(User.current)
          add_autowatcher(author) if (new_record? || author_id != author_id_was) && author != User.current
          unless assigned_to_id.nil? || assigned_to_id == User.current.id
            add_autowatcher(assigned_to) if new_record? || assigned_to_id != assigned_to_id_was
          end

          true
        end

        def log_time_allowed?(user = User.current)
          !closed? || user.allowed_to?(:log_time_on_closed_issues, project)
        end

        def editable_with_additionals?(user = User.current)
          return false unless editable_without_additionals?(user)
          return true unless closed?
          user.allowed_to?(:edit_closed_issues, project)
        end
      end

      def autoassign_get_group_list
        return unless Setting.issue_group_assignment?
        project.memberships
               .active
               .where("#{Principal.table_name}.type='Group'")
               .includes(:user, :roles)
               .each_with_object({}) do |m, h|
          m.roles.each do |r|
            h[r] ||= []
            h[r] << m.principal
          end
          h
        end
      end

      def new_ticket_message
        @new_ticket_message = ''
        message = Additionals.settings[:new_ticket_message]
        @new_ticket_message << message if message.present?
      end

      def status_x_affected?(new_status_id)
        return false unless Additionals.setting?(:issue_current_user_status)
        return false if Additionals.settings[:issue_assign_to_x].blank?
        if Additionals.settings[:issue_assign_to_x].include?(new_status_id.to_s)
          true
        else
          false
        end
      end

      private

      def auto_assigned_to
        return if !Additionals.setting?(:issue_auto_assign) ||
                  Additionals.settings[:issue_auto_assign_status].blank? ||
                  Additionals.settings[:issue_auto_assign_role].blank? ||
                  assigned_to_id.present?

        return unless Additionals.settings[:issue_auto_assign_status].include?(status_id.to_s)
        self.assigned_to_id = auto_assigned_to_user

        true
      end

      def auto_assigned_to_user
        manager_role = Role.builtin.find_by(id: Additionals.settings[:issue_auto_assign_role])
        groups = autoassign_get_group_list
        return groups[manager_role].first.id unless groups.nil? || groups[manager_role].blank?

        users_list = project.users_by_role
        return users_list[manager_role].first.id if users_list[manager_role].present?
      end

      def validate_change_on_closed
        return true unless closed?
        errors.add :base, :issue_changes_not_allowed unless User.current.allowed_to?(:edit_closed_issues, project)
      end

      def validate_open_sub_issues
        return true unless Additionals.setting?(:issue_close_with_open_children)
        errors.add :base, :issue_cannot_close_with_open_children if subject.present? &&
                                                                    closing? &&
                                                                    descendants.find { |d| !d.closed? }
      end

      def validate_current_user_status
        if (assigned_to_id_changed? || status_id_changed?) &&
           status_x_affected?(status_id) &&
           (assigned_to_id.blank? || assigned_to_id != User.current.id)
          errors.add :base, :issue_current_user_status
        else
          true
        end
      end

      def change_status_with_assigned_to_change
        return true unless Additionals.setting?(:issue_status_change)
        return true if Additionals.settings[:issue_status_x].blank?
        return true if Additionals.settings[:issue_status_y].blank?
        if !assigned_to_id_changed? &&
           status_id_changed? &&
           (Additionals.settings[:issue_status_x].include? status_id_was.to_s) &&
           Additionals.settings[:issue_status_y].to_i == status_id
          self.assigned_to = author
        end
      end
    end
  end
end
