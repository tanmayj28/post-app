class AddVisitorIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :visitor_id, :string
  end
end
