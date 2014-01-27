require 'test_helper'

class OrganizationsHelperTest < ActionView::TestCase
  test 'render book list' do
    @organization = organizations :cirope_sa

    assert_match /<ul/, render_book_list
  end

  test 'should not render book list' do
    @organization = Organization.new

    assert render_book_list.blank?
  end
end
