Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :posts
  root 'users#index'

  post 'posts/:id/upvote', to: 'posts#upvote', as: 'upvote_post'
  post 'posts/:id/downvote', to: 'posts#downvote', as: 'downvote_post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
