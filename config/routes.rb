Rails.application.routes.draw do
  root "staticpages#index"
  devise_for :users

  resources :suggestions, except: [:update, :show, :edit]
  resources :shops, only: [:index, :create, :destroy]

  namespace :admin do
    resources :shop_types
    get "/" => "staticpages#index"
  end
  
  namespace :shop_owner do
  	resources :suggestions, only: [:index, :update, :destroy]
  end
end
