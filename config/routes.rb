Rails.application.routes.draw do

  get 'contact_form/new'

  get 'contact_form/create'

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
  resources :contact_forms, only: [:new, :create]
end
