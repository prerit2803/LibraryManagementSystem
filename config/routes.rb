Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :bookings
  resources :rooms
  resources :users
  resources :track_bookings

  resources :users do
    member do
      get 'role'
      get 'managerole'
      put 'managerole'
      patch 'managerole'
      post 'manageadmin'
      get 'createnew'
      post 'createnew'
    end
  end

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  root 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
