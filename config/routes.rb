Rails.application.routes.draw do
  devise_for :users
  root to: "children#index"
  resources :children, only: [:new, :create, :index, :show] do
    resources :medicals, only: [:new, :create, :show] do
      resources :medical_comments, only: [:create]
    end
  end
  resources :diaries, only: [:new, :create, :show, :edit, :update] do
    resources :comments, only: [:create]
  end
end
