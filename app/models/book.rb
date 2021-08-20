class Book < ApplicationRecord

  validates :author, presence: true
  validates :title, presence: true

  has_many :reviews, dependent: :destroy
end