Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :questions do
    resources :answers, only: [:create] do
      resources :reviews, only: %i[new create]
    end
    resources :answers, only: %i[new create show update]
  end
  resources :answers, only: %i[index edit destroy]

  post "answers/:id/paid", to: "answers#paid", as: :paid
  get "/general", to: "questions#general", as: :general
  get "answers/:id/response", to: "answers#after_paid", as: :response
  get "answers/:id/choosed", to: "answers#choosed", as: :choosed
  resources :users, only: :show
end
