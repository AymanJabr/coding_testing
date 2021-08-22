class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :title
      t.text :description
      t.integer :rate
      t.timestamps
    end
    add_index :reviews, :book_id
    add_index :reviews, :user_id
    add_index :reviews, [:book_id, :user_id], unique: true
  end
end