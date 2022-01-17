Rails.application.routes.draw do
  resources :categories
  devise_for :users
  
  root "posts#index"
  resources :posts do
    resources :comments
    get "user/:user_id", to:  "posts#from_author", on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end