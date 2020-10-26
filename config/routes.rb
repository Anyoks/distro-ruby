Rails.application.routes.draw do
  resources :form_question_options
  resources :form_question_data
  resources :form_questions
  resources :forms
  resources :dma_assignments
  resources :dmas
  resources :zone_assignments
  resources :organizations
  devise_for :staffs
  resources :others
  resources :reports
  resources :further_actions
  post "/graphql", to: "graphql#execute"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  resources :assignments
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
  
  # root :to => "index"
  get "*path", to: static("index.html")
  # get "/login", to: static("index.html")
end
