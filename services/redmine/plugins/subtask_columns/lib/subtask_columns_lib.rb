module SubtaskColumnsLib
    
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
         unloadable
         alias_method_chain :render_descendants_tree, :listed
         alias_method :get_fields_for_project, :get_fields_for_project   
      end
    end


    module InstanceMethods

      def render_descendants_tree_with_listed(issue)    
          
        columns_list = get_fields_for_project(issue)
        # no field defined, then use render from core redmine (or whatever by other plugins loaded before this)
        unless columns_list.count > 0         
          return render_descendants_tree_without_listed(issue) 
        end  
        
        #continue here if there are fields defined 
        field_values = ''     
        s = '<table class="list issues odd-even">'
          
        # set header - columns names
        s << content_tag('th style="text-align:left"', l(:field_subject))
        columns_list.each do |column|
          s << content_tag('th', column.caption)
        end
        # set data
        issue_list(issue.descendants.visible.preload(:status, :priority, :tracker, :assigned_to).sort_by(&:lft)) do |child, level|
            css = "issue issue-#{child.id} hascontextmenu #{child.css_classes}"
            css << " idnt idnt-#{level}" if level > 0
            
            field_content = content_tag('td', check_box_tag("ids[]", child.id, false, :id => nil), :class => 'checkbox') + 
              content_tag('td', link_to_issue(child, :project => (issue.project_id != child.project_id)), :class => 'subject', :style => 'width: 50%')

            columns_list.each do |column|
              field_content << content_tag('td',column_content(column, child), :class =>"#{column.css_classes}")  
            end
            
            field_values << content_tag('tr', field_content, :class => css).html_safe
        end
                      
        s << field_values
        s << '</table>'
        s.html_safe
      end

      private 
      def get_fields_for_project(issue)        
        query = IssueQuery.new()
        query.project = issue.project
        available_fields = query.available_inline_columns
        subtask_fields = [] 
        unless issue.project.module_enabled?(:subtask_columns) 
          all_fields = Setting.plugin_subtask_columns["subtask_default_columns"] || []
        else                    
          all_fields = SubtaskListColumns.all.select {|c| c.prj_id == issue.project_id}.sort_by{|o| o.order}.collect{|f| f.ident} || []
        end      
        all_fields.each do |field|       
          if ['tracker', 'subject'].include? field
            next
          end  
          proj_field =   available_fields.select{|f| f.name.to_s == field} 
          subtask_fields << proj_field[0] if proj_field.count >0
        end
        return subtask_fields #this should be an array of QueryColumn 
      end
    end
end

