Rails.application.routes.draw do

  
  get 'favorite/create'
  get 'favorite/destroy'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'posts/create'
  get 'posts/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :posts
  get "posts/search" => "posts#search"
  post "posts/search" => "posts#search"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  
  
  
end
