# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'todos#index', as: 'home'
  get 'todos' => 'pages#todopage', as: 'todos'
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
  resources :todos do
    resources :comments
  end
end
