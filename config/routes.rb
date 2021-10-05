Rails.application.routes.draw do

  post '/create' => 'friendships#create'
  resources :friendships
  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :friendships, only: [:new, :create, :destroy, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:index, :create]
    resources :likes, only: [:create, :destroy]
  end
  post '/accept' => 'friendships#accept' 
  post '/reject' => 'friendships#reject'
  post '/cancel' => 'friendships#cancel'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
