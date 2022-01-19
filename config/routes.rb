Rails.application.routes.draw do
  devise_for :users
  root to: "children#index"
  resources :children, only: [:new, :create, :index, :show] do
    resources :medicals do
      resources :medical_comments, only: [:create, :destroy]
    end
  end
  resources :diaries, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
end
