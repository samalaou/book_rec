class BooksController < ApplicationController
    include SetBookConcern
    allow_unauthenticated_access only: %i[ index show ]

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
        @book = Book.new(book_params)
        redirect_with_notice(@book.save, @book, "Book created successfully!", "Failed to create book.")
    end

    def edit
    end

    def update
        redirect_with_notice(
            @book.update(book_params),
            @book,
            "Book updated successfully!",
            "Failed to update book."
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
end
