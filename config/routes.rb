Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/introduce'

  get 'static_pages/grow'

  get 'static_pages/contact'

  root 'application#hello'
end
