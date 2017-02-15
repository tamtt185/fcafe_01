Rails.application.routes.draw do
  root "staticpages#index"
  devise_for :users

  resources :suggestions, except: [:update, :show, :edit]
  namespace :admin do
    resources :shop_types
    get "/" => "staticpages#index"
  end
  resources :shops, only: [:index, :create, :destroy]
end
