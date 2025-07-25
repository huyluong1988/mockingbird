Rails.application.routes.draw do
  get "tasks/index"
  get "tasks/show"
  get "tasks/create"
  get "tasks/update"
  get "tasks/destroy"
  get "users/index"
  get "users/show"
  get "users/create"
  get "users/update"
  get "users/destroy"
  resources :posts
  resources :users, only: [:index, :show, :create] do
    resources :tasks, only: [:index]
  end
  post '/signup', to: 'users#create'
  post '/login', to: 'users#authenticate'
  post '/task', to: 'tasks#create' # This is for create a task
  delete '/task/:id', to: 'tasks#destroy' # This is for delete a task
  put '/task/:id', to: 'tasks#update' # This is for update a task
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
