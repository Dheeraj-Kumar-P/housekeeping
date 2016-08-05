Rails.application.routes.draw do
  root 'login#new'
  resources :sessions, only: [:create, :destroy]
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :login, only: [:new, :create]
  get 'login/block'
  get 'login/ath'
  resources :hotels do
    get 'new', on: :member
    post 'block', on: :member
  end
  resources :users, only: :create do
    get 'new', on: :member
  end
  resources :admin, only: 'show'
  resources :staff, only: [:show]
  resources :maid, only: [:show] do
    get 'cleaning', on: :member
    post 'start', on: :member
    post 'stop', on: :member
    post 'task', on: :member
  end
end
