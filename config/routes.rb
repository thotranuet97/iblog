Rails.application.routes.draw do
  get 'replies/create'

  get 'replies/destroy'

  resources :posts
  get 'comment/new'

  get 'comment/show'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'users/new'

  get 'users/show'

  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'signup' => 'users#new'
  resources :users 
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,          only: [:create, :destroy, :show]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :comments
  resources :relationships,       only: [:create, :destroy]
  resources :replies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
