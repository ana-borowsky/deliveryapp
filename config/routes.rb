Rails.application.routes.draw do
  devise_for :users
  root to: 'search_work_order#index'
  resources :work_orders, only: [:index, :new, :create, :edit, :show, :update] do
    get 'search', on: :collection 
  end
  resources :shipping_types, only: [:index, :new, :create, :edit, :show, :update]
  resources :vehicles, only: [:index, :new, :create, :edit, :show, :update] do
    get 'search', on: :collection 
  end
  get '/configurations', to: 'configurations#index' 
  resources :weight_configurations, only: [:index, :new, :create, :destroy]
  resources :delivery_time_configurations, only: [:index, :new, :create, :destroy]
  resources :price_per_distance_configurations, only: [:index, :new, :create, :destroy]
  resources :search_work_order, only: [:index] do
    get 'search', on: :collection
  end
end
