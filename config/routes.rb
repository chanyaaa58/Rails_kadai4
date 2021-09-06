Rails.application.routes.draw do
  root to: 'pictures#index'
  resources :sessions
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :favorites, only: [:create, :destroy, :index]
  get 'top', to: 'home#top'
  get 'about', to: 'home#about'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
