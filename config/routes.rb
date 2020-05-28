Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'retweets/create'
  get 'likes/create'
  get 'tweets/all_tweets'
  post 'likes/:tweet_id', to: 'likes#create', as: 'likes'
  post 'retweets/:tweet_id', to: 'retweets#create', as: 'retweets'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  post 'api/news'
  post 'api/:fecha1/:fecha2', to: 'api#between_dates' 
  post 'api/create_tweet', to: 'api#create_tweet'
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
