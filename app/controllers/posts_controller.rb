class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    service = post_index_service
    if service.perform
      render status: :ok, json: service.result
    else
      render_400 service.errors
    end
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_create_params)
    if @post.save
      render json: @post, status: :created
    else
      render_422 @post.errors
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_create_params
    params.fetch(:post, {}).permit(:content, :title, :visitor_id)
  end

  def post_index_service
    service = PostIndexService.new();
  end
end
