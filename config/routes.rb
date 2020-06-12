Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/introduce'
  get 'static_pages/grow'
  get 'static_pages/contact'
end
