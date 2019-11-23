class AddUpvoteCountToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :upvotes_count, :integer
  end
end
