Rails.application.routes.draw do

  root 'welcome#index'

  get '/about', to: 'about#show'
  get '/info', to: 'info#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/google/callback', to: 'sessions#create'
  get '/auth/google', as: 'google_login'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create]

  get 'users/verify', to: 'users#show_verify', as: 'verify'
  post 'users/verify'
  post 'users/resend'

end
