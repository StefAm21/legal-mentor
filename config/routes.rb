Rails.application.routes.draw do
  get 'studies/create'
  get 'studies/update'
  get 'studies/edit'
  get 'studies/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :questions do
    resources :answers, only: [:create] do
      resources :reviews, only: %i[new create]
      resources :payments, only: %i[new create]
    end
    resources :answers, only: %i[new create show update]
  end
  resources :answers, only: %i[index edit destroy]

  resources :payments, except: [:new, :create]


  post "answers/:id/paid", to: "answers#paid", as: :paid
  get "/questions_lawyers", to: "questions#general", as: :preguntas
  get "answers/:id/response", to: "answers#after_paid", as: :response
  get "answers/:id/choosed", to: "answers#choosed", as: :choosed
  post "answers/:id/procesar-pago", to: "answers#check_payment", as: :check_payment
  #get "pago", to: "answers#pago", as: :pago
  post "process_payment", to: "payments#process_payment"

  resources :users, only: %i[show edit update] do
    resources :studies, only: %i[create update destroy]
    resources :experiences, only: %i[create update destroy]
  end
end
