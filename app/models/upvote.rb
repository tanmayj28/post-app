class Upvote < ApplicationRecord
  belongs_to :post
  belongs_to :visitor

  validates :post, uniqueness: { scope: :visitor }
  validates :visitor, uniqueness: { scope: :post }
end
