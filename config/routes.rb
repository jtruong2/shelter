Rails.application.routes.draw do

  namespace :host_shelter do
    get 'properties/new'
  end

  root 'welcome#index'

  get '/about', to: 'about#show'
  get '/info', to: 'info#show'

  get '/login', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/google', as: 'google_login'
  delete '/logout', to: 'sessions#destroy'

  namespace :host_shelters do
    get '/sign_up', to: 'properties#new'
    resources :properties, only: [:create]
    get '/:id', to: 'properties#show'
  end
end
