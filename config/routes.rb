Rails.application.routes.draw do
  get "patients/index"
  get "patients/show"
  get "patients/new"
  get "patients/create"
  get "patients/edit"
  get "patients/update"
  get "patients/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  post "/login", to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :patients
  resources :categories
  resources :medical_cases
  resources :visits
  resources :appointments

  # Test endpoint
  get '/test/patients', to: 'test#dummy_patients'
end
