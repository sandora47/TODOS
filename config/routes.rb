# frozen_string_literal: true

Rails.application.routes.draw do
  root :to => 'todos#index', as: 'home'
  get 'todos' => 'pages#todopage', as: 'todos'
  resources :todos
  resources :pages
end
