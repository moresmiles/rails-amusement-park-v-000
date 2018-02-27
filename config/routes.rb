Rails.application.routes.draw do
  root 'users#home'

  resources :users
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  resources :attractions
  resources :rides, only: [:new]


end
