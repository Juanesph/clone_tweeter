class TweetsController < ApplicationController
 
  def index
    @tweets = Tweet.order(:last).page(params[:page])
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id]) 
  end

  def edit
  end

  def create
    @tweet = Tweet.create(tweet_params)
    
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
