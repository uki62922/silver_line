Rails.application.routes.draw do
  devise_for :users
   get 'messages/index'
  resources :users do
    resource :follow
    resources :followings
    resources :followers
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:new, :create]
  root to: "messages#index"
end
