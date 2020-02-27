Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

<<<<<<< HEAD
  get '/profile', to: 'users#show'
  post '/payments/new', to: 'payments#new'
  resources :users, only: [:new, :update]
=======
  get '/profile', to: 'artists#show'

  resources :artists, only: [:new, :update, :show]
>>>>>>> 3d73be17506c1eba587ee054a27e000ec900c788

  resources :styles, only: [:index]

  resources :shops, only: [:show, :new, :index, :create] do
    resources :artists, only: [:new, :create, :show]
  end

  namespace :users do
    resources :appointments
  end

  resources :artists do
    resources :appointments
  end
end
