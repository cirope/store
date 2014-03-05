module BooksHelper
  def kinds
    @book.valid_kinds.map { |k| [t("books.kinds.#{k}"), k] }
  end
end
