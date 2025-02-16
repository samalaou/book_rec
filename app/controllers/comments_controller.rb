class CommentsController < ApplicationController
  include SetBookConcern

  def create
    @comment = @book.comments.build(comment_params)
    @comment.user = Current.user

    redirect_with_notice(@comment.save, @book, "Comment added!", "Comment cannot be empty.")
  end

  private
    def comment_params
        params.expect(comment: [ :content ])
    end
end
