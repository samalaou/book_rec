class CommentsController < ApplicationController
  include SetBookConcern

  def create
    @comment = @book.comments.build(comment_params)
    @comment.user = Current.user

    if @comment.save
      redirect_to @book
    else
      redirect_to @book, alert: "Comment cannot be empty."
    end
  end

  private
    def comment_params
        params.expect(comment: [ :content ])
    end
end
