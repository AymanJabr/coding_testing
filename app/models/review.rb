class Review < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :rate, presence: true

  belongs_to :user
  belongs_to :book

  def search_by_title(title)
    reviews.map { |review| review.friend unless review.confirmed }.compact

    Customer.where(first_name: 'does not exist')

    scope :ordered_by_most_recent, -> { order(created_at: :desc) }

    Customer.where(weekly_subscriber: true).find_each do |customer|
        NewsMailer.weekly(customer).deliver_now
    end

    Book.where("title = ? AND out_of_print = ?", params[:title], false)


  end
end