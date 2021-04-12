Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  get 'messages/index'
  root to: "prototypes#index"
  
  resources :prototypes, only: [:edit, :update, :new, :create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :prototypes do
    resources :comments, only: :create
  end
  resources :users, only: :show
end