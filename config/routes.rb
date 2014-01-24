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
    resources :cities
    resources :customers
    resources :items
    resources :users

    resources :books, only: [] do
      resources :invoices, shallow: true
      resources :receipts, shallow: true
    end

    resources :organizations do
      resources :books, shallow: true
    end
  end

  root 'sessions#new'
end
