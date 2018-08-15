# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'subtask_list_columns', :to => 'subtask_list_columns#index'
post "subtask_list_columns", :to => "subtask_list_columns#update", :as => 'update_subtask_columns'
