Rails.application.routes.draw do
  root "staticpages#index"
  devise_for :users
end
