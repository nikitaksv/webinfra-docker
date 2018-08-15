This is a forked of Subtask_list_columns by 'SMS-IT: S.Parfenov, E.Redkozubov'. All credit goes to the original authors
This plugin is an alternative to Subtask_list_columns and could not use together with original one
I test it with redmine 2.6.7. I am not sure if it works with redmine 3.x or not
The main changes are
1- I rely totally on the QueriesHelper to select and display columns for subtasks 
2- There are two settings:
  - The setting in plugins/configuration will acts as default for all project, unless
  - If a the Subtask Columns module is enabled for a project, the default setting is ignored. 
    Instead, the setting for that particular project ( done via Subtask Columns tab in project menu) is used
    
    In any case, if no columns defined, the system render is used
    Please note that Tracker, ID, and Subject is always display so no need to select them in setting
  
    
 