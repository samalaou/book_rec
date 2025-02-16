class RatingsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.find_or_initialize_by(user: Current.user)
    @rating.rating = params[:rating]

    if @rating.save
      redirect_to book_path(@book, rating: @rating.rating), notice: "Rating submitted successfully!"
    else
      redirect_to @book, alert: "Unable to submit rating."
    end
  end
end
