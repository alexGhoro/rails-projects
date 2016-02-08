Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:create, :destroy, :update, :show]
  end
  resources :comments
  devise_for :users

  root 'welcome#index'


end
