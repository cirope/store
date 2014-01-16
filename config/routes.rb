Store::Application.routes.draw do

  # Sessions
  get 'login', to: 'sessions#new', as: 'login'
  post 'sessions', to: 'sessions#create', as: 'sessions'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :password_resets, only: [:new, :create, :edit, :update]

  constraints AdminSubdomain do
    resources :accounts
  end

  constraints AccountSubdomain do
    # Launchpad
    get '/launchpad', to: 'launchpad#index', as: 'launchpad'

    # Profiles
    get 'profile', to: 'profiles#edit', as: 'profile'
    patch 'profile', to: 'profiles#update'

    # Resorces
    resources :customers
    resources :users
    resources :organizations
  end

  root 'sessions#new'
end
