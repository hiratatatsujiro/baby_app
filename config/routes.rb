Rails.application.routes.draw do
  devise_for :users
  root to: "children#index"
  resources :children, only: [:new, :create, :index]
  resources :diary, only: [:index, :new, :create]
end
