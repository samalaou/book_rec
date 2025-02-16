class RatingsController < ApplicationController
    before_action :authenticated?

    def create
      @book = Book.find(params[:book_id])
      @rating = @book.ratings.find_or_initialize_by(user: Current.user)
      @rating.rating = params[:rating]

      if @rating.save
        redirect_to @book
      else
        redirect_to @book, alert: "Unable to submit rating."
      end
    end
end
