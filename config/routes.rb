Rails.application.routes.draw do
  root 'links#index'

  resources :links do
    get '/up-vote', to: 'votes#up_vote', as: :up_vote
    get '/down-vote', to: 'votes#down_vote', as: :down_vote
  end

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post '/users' => 'users#create'
  get 'user/:id' => 'users#show', as: 'user'
end
