Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :accounts
  resources :walkroutes
  resources :subzones
  resources :zones
  resources :schemes
  resources :stages
  resources :staffs
  resources :positions
  resources :tasks
  resources :subdepartments
  resources :departments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
