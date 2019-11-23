class Upvote < ApplicationRecord
  belongs_to :post
  belongs_to :visitor

  validates :post, uniqueness: { scope: :visitor }
  validates :visitor, uniqueness: { scope: :post }

  after_create :increment_upvote
  after_destroy :destroy_upvote

  def increment_upvote
    post.upvotes_count += 1
    post.save
  end

  def destroy_upvote
    post.upvotes_count -= 1
    post.save
  end
end
