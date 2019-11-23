class Post < ApplicationRecord
	has_many :upvotes, dependent: :destroy
	belongs_to :visitor

	def total_upvotes
		upvotes.count
	end
end
