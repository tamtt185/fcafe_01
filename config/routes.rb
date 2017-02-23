Rails.application.routes.draw do
  root "staticpages#index"
  devise_for :users

  resources :suggestions, except: [:update, :show, :edit]
  resources :shops

  namespace :admin do
    get "/" => "staticpages#index"
    resources :requests
    resources :shop_types
    resources :categories
  end

  namespace :shop_owner do
  	resources :suggestions, only: [:index, :update, :destroy]
    resources :shops
    resources :albums
    resources :tables
  end
end
