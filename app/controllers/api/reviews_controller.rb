module Api
  class ReviewsController < ApplicationController

    def index
      reviews = Review.all
      search_term = params[:search]
      search_by_title(reviews, search_term)

      render json: ReviewsRepresenter.new(reviews).as_json
    end



  end
end