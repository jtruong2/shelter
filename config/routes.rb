Rails.application.routes.draw do
  root 'welcome#index'

  get '/about', to: 'about#show'
  get '/info', to: 'info#show'
end
