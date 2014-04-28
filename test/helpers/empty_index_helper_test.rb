require 'test_helper'

class EmptyIndexHelperTest < ActionView::TestCase
  test 'empty index content' do
    assert_match I18n.t('views.generic.empty_index'), empty_index_content

    params[:q] = 'test'
    expected = t 'views.generic.empty_search.title_html', search: 'test'

    assert_match expected, empty_index_content
  end
end
