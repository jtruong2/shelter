Rails.application.routes.draw do
  root 'welcome#index'

  get '/about', to: 'about#show'
  get '/info', to: 'info#show'

  get '/login', to: 'sessions#new'
  get '/auth/google/callback', to: 'sessions#create'
  get '/auth/google', as: 'google_login'
  # get '/o/oauth2/auth', as: 'google_login'
  get '/balls', to: 'sessions#destroy'
end
