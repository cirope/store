require 'test_helper'

class BooksHelperTest < ActionView::TestCase
  test 'kinds' do
    @book = books :cirope_sa_a

    assert_respond_to kinds, :each
  end
end
