Store::Application.routes.draw do
  # Dashboard and launchpad
  get '/launchpad', to: 'launchpad#index', as: 'launchpad'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # Sessions
  get 'login', to: 'sessions#new', as: 'login'
  post 'sessions', to: 'sessions#create', as: 'sessions'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # Profiles
  get 'profile', to: 'profiles#edit', as: 'profile'
  patch 'profile', to: 'profiles#update'

  # Resources
  resources :accounts
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users

  root 'sessions#new'
end
