Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users, only: [:new, :update, :show]

  resources :shops, only: [:show, :new, :index, :create] do
    resources :users, only: [:new, :create, :show]
  end
end
