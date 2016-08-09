Rails.application.routes.draw do
  root 'login#new'
  resources :sessions, only: [:create, :destroy]
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :login, only: [:new, :create]
  get 'login/block'
  get 'login/ath'
  get 'application/logged'
  resources :hotels do
    get 'new', on: :member
    get 'block', on: :member
    post 'update', on: :member
  end
  resources :users, only: [:create, :edit] do
    get 'new', on: :member
    post 'update', on: :member
  end
  resources :admin, only: 'show'
  resources :staff, only: [:show, :edit] do
    post 'update', on: :member
  end
  resources :maid, only: [:show, :edit] do
    get 'delete', on: :member
    get 'cleaning', on: :member
    post 'update', on: :member
    post 'start', on: :member
    post 'stop', on: :member
    post 'task', on: :member
  end
end
