Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users
  resources :articles do
    resources :comments
  end
  get "/topics", to: "topics#index"
  get "/topics/:id", to: "topics#new"
  root "articles#index"
end