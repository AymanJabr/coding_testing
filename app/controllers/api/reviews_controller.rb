class ReviewsController < ApplicationController

    def index
      @reviews = Review.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @reviews }
        format.json { render :json => @reviews }
      end
    end

  end