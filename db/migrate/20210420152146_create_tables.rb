class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string :email, null: false
      t.string :name
      
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.string :encrypted_password, null: false
      t.datetime :remember_created_at
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.timestamps null: false
    end
    add_index :admin_users, :reset_password_token, unique: true
    create_table :refresh_auth_tokens do |t|
      t.timestamps null: false
    end
    create_table :blacklisted_auth_tokens do |t|
      t.timestamps null: false
    end


    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :username, null: false, default: ""

      # The few lines below are used by devise
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps null: false
    end
    add_index :users, :email,                unique: true
    add_index :users, :username,             unique: true
    add_index :users, :reset_password_token, unique: true


    create_table :books do |t|
      t.text :title
      t.text :author
      t.text :genre
      t.text :description
    
      t.timestamps
    end


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


add_reference :books, :author, null: false, foreign_key: true
