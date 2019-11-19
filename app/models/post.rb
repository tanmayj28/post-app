class Post < ApplicationRecord
	has_many :upvotes, dependent: :destroy

	def total_upvotes
		upvotes.count
	end
end
