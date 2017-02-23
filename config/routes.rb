Rails.application.routes.draw do

  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show, :new, :create]
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

  #Session Controller routes
  get "signin", to: "sessions#new"
  get "signout", to: "sessions#destroy"
  post "/sessions/create", to: "sessions#create"

end
