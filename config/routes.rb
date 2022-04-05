Rails.application.routes.draw do
root 'todos#index', as: 'home'
get 'todos' => 'pages#todopage', as: 'todos'
resources :todos
resources :pages
end
