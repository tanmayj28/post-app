class PostIndexService
  attr_reader :result

  def perform
    get_all_posts &&
      add_visitor &&
      set_result
  end

  private

  attr_accessor :posts

  def get_all_posts
    @posts = Post.includes(:visitor).all
  end

  def add_visitor
    posts.each do |post|
      post.visitor_name = post.visitor.name
    end
  end

  def set_result
    @result ||= posts
  end
end
