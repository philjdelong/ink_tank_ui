Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/profile', to: 'artists#show'
  post '/payments/new', to: 'payments#new'
  resources :artists, only: [:new, :update, :show]

  resources :styles, only: [:index]

  resources :shops, only: [:show, :new, :index, :create] do
    resources :artists, only: [:new, :create, :show]
  end

  resources :artists do
    resources :appointments, only: [:index, :create]
  end

  namespace :artist do
    resources :dashboard
    resources :appointments
  end 
end
