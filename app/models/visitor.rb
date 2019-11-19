class Visitor < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :upvotes, dependent: :destroy
end
