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
  resources :tweets do 
    collection do
      get :searching_tweet
    end
  end
  resources :likes
  resources :users
  root 'tweets#index'
end
