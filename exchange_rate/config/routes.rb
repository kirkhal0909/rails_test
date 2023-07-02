Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'usd_rate#index'

  get '/usd_rate/get', to: 'usd_rate#get'
  get '/admin', to: 'admin#index'
  post '/admin/force_usd', to: 'admin#force_usd'
end
