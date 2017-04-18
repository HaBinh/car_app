Rails.application.routes.draw do
  get 'vehicles/new'

  get 'vehicles/show'

  get 'vehicles/edit'

  get 'vehicles/update'

  get 'vehicles/destroy'

  get 'vehicles/search'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/manage', to: 'static_pages#manage'
  patch '/take_vehicle', to: 'rentals#take_vehicle'
  patch '/return_vehicle', to: 'rentals#return_vehicle'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :vehicles
  resources :searches
  resources :rentals
end
