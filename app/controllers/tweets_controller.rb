class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(:created_at).page(params[:page])
  end

  def new
    @tweet = Tweet.new
  end

  def show
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:notice] = "Tu Tweet ha sido creado"      
    else
      flash[:notice] = "el tweet no se creo"      
    end
    redirect_to "/tweets"
  end

  def update
  end

  def destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, :image_url)
  end
  
end
