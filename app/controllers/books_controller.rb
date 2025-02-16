class BooksController < ApplicationController
    include SetBookConcern
    allow_unauthenticated_access only: %i[ index show ]
    before_action :authorize_user!, only: %i[edit update destroy]

    def index
        @books = Book.all
    end

    def show
        @rating = @book.ratings.find_by(user: Current.user)
    end

    def new
        @book = Book.new
    end

    def create
        @book = Current.user.books.new(book_params)
        redirect_with_notice(
            @book.save,
            @book,
            "Book created successfully!",
            "Failed to create book.",
            :new_book
        )
    end

    def edit
    end

    def update
        redirect_with_notice(
          @book.update(book_params),
          @book,
          "Book updated successfully!",
          "Failed to update book.",
          :edit_book
        )
      end

    def destroy
        @book.destroy
        redirect_to books_path, notice: "Book deleted successfully!"
    end

    private
        def book_params
          params.expect(book: [ :title, :author, :description, :featured_image ])
        end

        def authorize_user!
            unless @book.user == Current.user
              flash.now[:alert] = "You are not authorized to perform this action."
              render :show, status: :forbidden
            end
        end
end
