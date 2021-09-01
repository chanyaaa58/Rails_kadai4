Rails.application.routes.draw do
  resources :sessions
  resources :pictures
  resources :users
  get 'top', to: 'home#top'
  get 'about', to: 'home#about'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
