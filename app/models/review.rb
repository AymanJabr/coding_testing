class Review < ApplicationRecord
  include Api::ReviewHelper

  validates :title, presence: true
  validates :description, presence: true
  validates :rate, presence: true

  belongs_to :user
  belongs_to :book

  
end