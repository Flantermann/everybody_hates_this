Rails.application.routes.draw do
  devise_for :users, :controllers => { sessions: 'users/sessions' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: :show do
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
end
