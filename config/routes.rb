Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :missions do
    resources :milestones, only: :create
  end
  resources :milestones, only: [ :update, :destroy ]
  resources :contract, only: [ :show ]
end
