Rails.application.routes.draw do
  root "staticpages#index"
  devise_for :users

  resources :suggestions, except: [:update, :show, :edit]
  resources :shops

  namespace :admin do
    resources :shop_types
    get "/" => "staticpages#index"
    resources :requests
  end

  namespace :shop_owner do
  	resources :suggestions, only: [:index, :update, :destroy]
    resources :shops
    resources :albums
  end
end
