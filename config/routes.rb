Rails.application.routes.draw do
  resources :pictures
  resources :users
  get 'top', to: 'home#top'
  get 'about', to: 'home#about'
end
