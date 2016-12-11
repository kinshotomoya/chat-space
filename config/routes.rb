Rails.application.routes.draw do
  devise_for :users
    put 'user' => 'devise/registrations#update', as: :update_user_registration
  root 'groups#index'
  resources :groups
end
