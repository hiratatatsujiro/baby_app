Rails.application.routes.draw do
  devise_for :users
  root to: "children#index"
  resources :children, only: [:new, :create, :index]
  resources :diaries, only: [:new, :create] do
    resources :comments, only: [:create]
  end
end
