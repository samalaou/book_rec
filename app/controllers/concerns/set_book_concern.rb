module SetBookConcern
    extend ActiveSupport::Concern

    included do
      before_action :set_book, if: :book_param_present?
    end

    private

    def book_param_present?
      params[:book_id].present? || params[:id].present?
    end

    def set_book
      @book = Book.find_by(id: params[:book_id] || params[:id])
    end
end
