module Additionals
  module Patches
    module TimeEntryPatch
      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          alias_method :editable_by_without_additionals?, :editable_by?
          alias_method :editable_by?, :editable_by_with_additionals?
          validate :validate_issue_allowed
        end
      end

      module InstanceMethods
        def validate_issue_allowed
          return unless issue_id && issue
          return if Setting.commit_logtime_enabled? && (issue.updated_on + 3.seconds) > Additionals.now_with_user_time_zone
          errors.add(:issue_id, :issue_log_time_not_allowed) unless issue.log_time_allowed?
        end

        def editable_by_with_additionals?(usr)
          return false unless editable_by_without_additionals?(usr)
          return true unless issue_id && issue
          issue.log_time_allowed?
        end
      end
    end
  end
end
