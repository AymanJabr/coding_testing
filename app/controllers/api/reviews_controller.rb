module Api
  class ReviewsController < ApplicationController

    def index

      if(params.has_key?(:search) && params[:search].length > 3)
        search_term = params[:search]
        filtered_reviews = nil

        if(params.has_key?(:book_id))
          # Here we are searching for reviews inside what I am assuming is a book page.

          reviews = Review.includes(:book).where(book_id: params[:book_id])

          filtered_reviews = {search_by_title(reviews, search_term) + search_by_description(reviews, search_term)}.uniq

        else
          # Here we are searching for reviews of books by the people that the current user is following
          filtered_reviews = search_by_following_users(search_term)

        end
        render json: ReviewsRepresenter.new(reviews).as_json
      else
        render :json => {:error => "not-found"}.to_json, :status => 404
      end     

      # The 3 methods below can be used to search by things individually.

      # search_by_title(reviews, search_term)
      # search_by_description(reviews, search_term)
      # search_by_following_users(search_term)

      # If the challenge was to return all of the reviews of a certain book, plus any reviews that come from following another user, we can use something like this

      # filtered_reviews = {search_by_following_users(search_term) + search_by_title(reviews, search_term) + search_by_description(reviews, search_term)}.uniq


    end

  end
end