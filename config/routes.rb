Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :issues do
    resources :milestones, only: :create
  end
  resources :milestones, only: [ :update, :destroy ]
end
