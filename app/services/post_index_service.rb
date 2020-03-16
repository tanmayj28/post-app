class PostIndexService
  attr_reader :result

  def perform
    add_visitor &&
      set_result
  end

  private

  attr_accessor :posts

  def add_visitor
    @posts = []
    Post.includes(:visitor).all.each do |post|
      @posts << post.attributes.merge({visitor_name: post.visitor.name,upvotes_count: post.upvotes.count})
    end
  end

  def set_result
    @result ||= posts
  end
end