module BookScoped
  extend ActiveSupport::Concern

  included do
    before_action :_set_book
  end

  private

    def _set_book
      @book = if params[:book_id]
        Book.find params[:book_id]
      elsif @resource
        @resource.book
      end
    end
end
