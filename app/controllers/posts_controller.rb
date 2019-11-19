class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.all
    render json: @posts, status: :ok
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
    params.fetch(:post, {}).permit(:content)
  end
end
