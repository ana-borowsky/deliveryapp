Rails.application.routes.draw do
  devise_for :users
  root to: 'work_orders#index'
  resources :work_orders, only: [:index, :new, :create, :edit, :show, :update] do
    get 'search', on: :collection 
  end
  resources :shipping_types, only: [:index, :new, :create, :edit, :show, :update]
  resources :vehicles, only: [:index, :new, :create, :edit, :show, :update] do
    get 'search', on: :collection 
  end
end
