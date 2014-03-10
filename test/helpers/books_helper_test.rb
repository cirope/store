require 'test_helper'

class BooksHelperTest < ActionView::TestCase
  test 'kinds' do
    @book = books :cirope_sa_a

    assert_respond_to kinds, :each
  end

  test 'render organization books' do
    @organization = organizations :cirope_sa
    @book = @organization.books.first

    assert_match /#{@book.to_s}/, render_organization_books
  end
end
