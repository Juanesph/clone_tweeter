Rails.application.routes.draw do
  get 'retweets/create'
  get 'likes/create'
  post 'likes/:tweet_id', to: 'likes#create', as: 'likes'
  post 'retweets/:tweet_id', to: 'retweets#create', as: 'retweets'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "home#index"
  resources :tweets
  resources :likes
  root 'tweets#index'
end
