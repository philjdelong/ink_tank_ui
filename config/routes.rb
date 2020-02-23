Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/shops/:id/users/:user_id', to: 'users#new', as: 'complete_shop_user'
  patch '/shops/:id/users/:user_id', to: 'users#update', as: 'update_shop_user'


  resources :shops, only: [:show, :new, :index, :create] do
    resources :users, only: [:new, :create, :show]
  end
end
