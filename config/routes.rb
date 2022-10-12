Rails.application.routes.draw do
  root to: 'work_orders#index'
  resources :work_orders, only: [:index, :new, :create, :edit, :show, :update]
end
