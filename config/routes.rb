Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users, :controllers => { sessions: 'users/sessions', registrations:'users/registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: [ :index, :show, :create] do
    resources :messages, only: :create
  end
  resources :missions do
    resources :milestones, only: :create
  end

  resources :missions do
    member do
      patch 'finish', to: "missions#finish"
    end
  end

  resources :milestones, only: [ :update, :destroy ]
  resources :contracts, only: [ :new, :create, :show ] do
    member do
      patch 'accept', to: "contracts#accept"
      patch 'decline', to: "contracts#decline"
    end
  end

  get '/dashboard', to: 'pages#dashboard'
  get '/about', to: 'pages#about'
  get '/blog', to: 'pages#blog'
  # match "/404", to: "errors#not_found", via: :all
  # match "/500", to: "errors#internal_server_error", via: :all
end
