Rails.application.routes.draw do
  root 'static_pages#home'
  get "/introduce", to: "static_pages#introduce"
  get "/grow", to: "static_pages#grow"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users
end
