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
        if @book.save
          redirect_to @book
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @book.update(book_params)
            redirect_to @book
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @book.destroy
        redirect_to books_path
    end

    private
        def book_params
          params.expect(book: [ :title, :author, :description, :featured_image ])
        end
end
