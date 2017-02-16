Rails.application.routes.draw do
  root "staticpages#index"
  devise_for :users
  namespace :admin do
    resources :shop_types
    get "/" => "staticpages#index"
  end
  resources :shops
end
