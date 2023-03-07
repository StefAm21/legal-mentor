Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :questions do
    resources :answers, only: :create do
      resources :reviews, only: %i[new create]
    end
    resources :answers, only: %i[new create show]
  end
  resources :answers, only: %i[index edit update destroy]
end
