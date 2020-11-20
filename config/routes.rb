Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
  resources :users, only: [:edit, :update,:show]do
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:new, :create]

end
