require 'redmine'

require_dependency 'subtask_columns_lib'

Rails.configuration.to_prepare do
  unless IssuesHelper.included_modules.include?(SubtaskColumnsLib)
      IssuesHelper.send(:include, SubtaskColumnsLib)
  end

end


Redmine::Plugin.register :subtask_columns do
  name 'Subtask columns plugin'
  author 'SMS-IT: S.Parfenov, E.Redkozubov, forked by Quan LTT'
  description 'Customize columns in list of subtasks on issue page'
  version '0.0.4' 
 
  project_module :subtask_columns do
     permission :manage_subtask_columns, { :subtask_list_columns => [:index] } , :require => :member 
  end 
  menu :project_menu, :subtask_columns, {:controller =>'subtask_list_columns', :action => 'index'}, :param => :project_id,
    :caption => "Subtask Columns", before: :settings
         
  settings default: {'empty' => true}, partial: 'settings/subtask_columns_settings'
  
end