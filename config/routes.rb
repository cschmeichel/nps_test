Rails.application.routes.draw do
  root 'users#index'
  resources :premium_subscriptions do
    get :xlsdata, on: :collection
  end
  resources :users
end
