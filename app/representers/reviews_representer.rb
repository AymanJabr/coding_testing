class ReviewsRepresenter

    def initialize(reviews)
        @reviews = reviews
    end


    def as_json
        reviews.map do |review|
            {
                reviewer_name: review.user.username,
                title: review.title,
                description: review.description,
                rate: review.rate,
            }

        end
    end


end