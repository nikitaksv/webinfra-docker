# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# Don't create routes for repositories resources with only: []
# do not override Redmine's routes.
resources :issues, only: [] do
  resource 'assign_to_me', only: %i[update], controller: 'additionals_assign_to_me'
  resource 'change_status', only: %i[update], controller: 'additionals_change_status'
end
