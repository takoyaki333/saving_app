Rails.application.routes.draw do
  root "home#index"

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/dashboard", to: "goals#index"

  resources :goals do 
    resources :savings, only: [:create, :index]
  end

  resources :users, only: [:new, :create] 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
