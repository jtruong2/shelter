Rails.application.routes.draw do

  root 'welcome#index'

  get '/about', to: 'about#show'
  get '/info', to: 'info#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/google', as: 'google_login'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create]
end
