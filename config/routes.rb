Rails.application.routes.draw do
  root 'welcome#index'

  get '/about', to: 'about#show'

  get '/info', to: 'info#show'

  get '/alerts', to: 'alerts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'
  get '/auth/google/callback', to: 'sessions#create'

  get '/auth/google', as: 'google_login'

  namespace :host_shelters do
    get '/sign_up', to: 'properties#new'
    resources :properties, only: [:create, :new]
    get '/:id', to: 'properties#show'
  end

  resources :users, only: [:new, :create]
  resources :contact_forms, only: [:new, :create]
end
