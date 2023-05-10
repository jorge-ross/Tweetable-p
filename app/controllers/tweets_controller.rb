class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets
  def index
    @tweets = Tweet.all
    @new_tweet = Tweet.new
    @new_like= Like.new
  end

  # GET /tweets/1
  def show
  end

  # GET /tweets/new
  # def new
  #   @tweet = Tweet.new
  # end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  def create
    @new_tweet = Tweet.new(tweet_params)

    @new_tweet.save

    redirect_to root_path
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: "Tweet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: "Tweet was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      # binding.pry
      params.require(:tweet).permit(:body, :user_id, :replied_to_id)
    end
end
