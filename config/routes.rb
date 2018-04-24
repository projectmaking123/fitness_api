Rails.application.routes.draw do
  devise_for :users
  namespace :v1, defaults: { format: :json } do
    resources :wods
    resources :sessions, only: [:create, :destroy, :show]
    resources :users, only [:create]
  end
end
