require 'test_helper'

class PaginationHelperTest < ActionView::TestCase
  test 'pagination' do
    skip
    assert_not_nil paginate(User.paginate(page: 1, per_page: 1))
  end
end
