class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id, null: false
      t.integer :followed_user_id, null: false

      t.timestamps
    end
    add_index :reviews, :follower_id
    add_index :reviews, :followed_user_id
    add_index :reviews, [:follower_id, :followed_user_id], unique: true
  end
end