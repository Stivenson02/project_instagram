Rails.application.routes.draw do


  resources :profiles
  resources :publication_contents
  resources :publications do
    resources :comments
    resources :publication_like, only: [:create, :show, :destroy]
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "publications#index"
end
