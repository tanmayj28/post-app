class VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :destroy, :list_posts]

  def index
    @visitors = Visitor.all
    render json: @visitors, status: :ok
  end

  def show
    render json: @visitor.attributes.merge({upvoted_posts: @visitor.upvotes.pluck(:post_id)})
  end

  def list_posts
    render json: {upvoted_posts: @visitor.upvotes.pluck(:post_id)}
  end

  def create
    @visitor = Visitor.new(visitor_create_params)
    if @visitor.save
      render json: @visitor, status: :created
    else
      render_422 @visitor.errors
    end
  end

  def destroy
    @visitor.destroy
  end

  private

  def set_visitor
    @visitor = Visitor.find(params[:id])
  end

  def visitor_create_params
    params.fetch(:visitor, {}).permit(:name)
  end
end
