Rails.application.routes.draw do
  root 'links#index'

  resources :links

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
