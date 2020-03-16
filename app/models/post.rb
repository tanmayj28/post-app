class Post < ApplicationRecord
	has_many :upvotes, dependent: :destroy
	belongs_to :visitor
end
