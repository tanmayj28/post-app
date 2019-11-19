class CreateUpvotes < ActiveRecord::Migration[6.0]
  def change
    create_table :upvotes do |t|
      t.references :post, null: false, foreign_key: true
      t.references :visitor, null: false

      t.timestamps
    end
  end
end
