Rails.application.routes.draw do
  get 'contacts/new'

  get 'contacts/create'

  root 'static_pages#home'
  get "/introduce", to: "static_pages#introduce"
  get "/grow", to: "static_pages#grow"
  #get "/community", to: "microposts#index"
  get "/contact", to: "contacts#new"
  post "/contact", to: "contacts#create"
  get "/signup", to: "users#new"
  post '/signup',  to: 'users#create'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :microposts
  resources :contacts
end
