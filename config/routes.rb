Rails.application.routes.draw do
  get 'pictures', to: 'pictures#index'
  get 'pictures/new', to: 'pictures#new'
  get 'pictures/:id', to: 'pictures#show'
  post 'pictures/create', to: 'pictures#create'
  get 'pictures/:id/edit', to: 'pictures#edit'

  get 'top', to: 'home#top'
  get 'about', to: 'home#about'
end
