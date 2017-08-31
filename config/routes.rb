Rails.application.routes.draw do
  root 'welcome#index'

  get '/about', to: 'about#show'
  get '/info', to: 'info#show'

  get '/login', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  # get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google', as: 'google_login'
  # get '/o/oauth2/auth/google', as: 'google_login'
end
