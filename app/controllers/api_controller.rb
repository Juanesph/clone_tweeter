class ApiController < ActionController::API
  acts_as_token_authentication_handler_for User

  def news
    @tweets = Tweet.all.order(created_at: :desc).page(params[:page])
    @tweets = @tweets.map do |tweet|
                {
                  id: tweet.id,
                  content: tweet.content,
                  user_id: tweet.user_id,
                  likes_count: tweet.likes.count,
                  retweets_count: tweet.retweets.count,
                }
    end
    render json: @tweets
  end

  def between_dates
    @tweets = Tweet.where(created_at: date1..date2)
    @tweets = @tweets.map do |tweet|
      {
        id: tweet.id,
        content: tweet.content,
        user_id: tweet.user_id,
        likes_count: tweet.likes.count,
        retweets_count: tweet.retweets.count,
        date: tweet.created_at
      }
    end
    render json: @tweets
  end

  def create_tweet
    @tweet = Tweet.create(
      content: params.require(:content),
      user: current_user
    )
    
    render json: @tweet
  end


  
  private
  def date1
    params[:fecha1].to_date.beginning_of_day
  end

  def date2
    params[:fecha2].to_date.end_of_day
  end
end
