Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups do
    resources :chats, only: [:index, :create]
  end
  resources :users, only: :index do
    collection do
      get 'search'
    end
  end
end
