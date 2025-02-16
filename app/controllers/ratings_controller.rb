class RatingsController < ApplicationController
  include SetBookConcern

  def create
    @rating = @book.ratings.find_or_initialize_by(user: Current.user)
    @rating.rating = params[:rating]

    if @rating.save
      redirect_to book_path(@book, rating: @rating.rating), notice: "Rating submitted successfully!"
    else
      redirect_to @book, alert: "Unable to submit rating."
    end
  end
end
