Rails.application.routes.draw do
  root 'links#index'

  resources :links

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  resources :users
end
