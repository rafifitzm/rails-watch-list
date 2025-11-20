Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "lists#index"
  # User actions:
  # As a user, I can see all my movie lists
  # As a user, I can create a movie list
  # As a user, I can see the details of a movie list
  resources :lists, only: [:index, :new, :create, :show] do
    # As a user, I can bookmark a movie inside a movie list
    # => lists#show form => bookmark#create
    resources :bookmarks, only: [:create]
  end
end
