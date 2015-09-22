Rails.application.routes.draw do
  root 'links#index'

  resources :links do
    post '/vote', to: 'votes#vote_on', as: :vote_on
    resources :comments
  end

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post '/users' => 'users#create'
  get 'user/:id' => 'users#show', as: 'user'
end
