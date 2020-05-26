class RetweetsController < ApplicationController
  before_action :authenticate_user!

  def create
      @retweet = Retweet.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
      if @retweet && @retweet.active
        @retweet.update_attribute(:active, 'false')
        @retweet.destroy
      elsif @retweet && !@retweet.active
        @retweet.update_attribute(:active, 'true')
        
      else
        @retweet = Retweet.create(user_id: current_user.id, tweet_id: params[:tweet_id])
      end  
      redirect_to root_path
  end
end
