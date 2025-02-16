class RatingsController < ApplicationController
  include SetBookConcern

  def create
    @rating = @book.ratings.find_or_initialize_by(user: Current.user)
    @rating.rating = params[:rating]

    redirect_with_notice(
      @rating.save,
      book_path(@book, rating: @rating.rating),
      "Rating submitted successfully!",
      "Unable to submit rating."
    )
  end
end
