class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum:20 }
 
  has_many :reviews, dependent: :destroy

  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :given_follows, source: :followed_user
end