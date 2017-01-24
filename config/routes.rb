Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups do
    resources :chats, only: [:index, :create]
  end
end
