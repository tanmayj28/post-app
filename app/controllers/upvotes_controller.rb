class UpvotesController < ApplicationController
  before_action :set_upvote, only: [:destroy]

  def create
    @upvote = Upvote.new(upvote_create_params)
    if @upvote.save
      render json: @upvote, status: :created
    else
      render_422 @upvote.errors
    end
  end

  def destroy
    @upvote.destroy
  end

  private

  def set_upvote
    @upvote = Upvote.find(params[:id])
  end

  def upvote_create_params
    params.fetch(:upvote, {}).permit(:post_id, :visitor_id)
  end
end
