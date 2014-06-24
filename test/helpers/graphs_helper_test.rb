require 'test_helper'

class GraphsHelperTest < ActionView::TestCase
  test 'include graphs' do
    @view_flow = ActionView::OutputFlow.new

    assert !content_for?(:head)

    include_graphs_js

    assert content_for?(:head)
    assert_match /<script/, content_for(:head)
  end
end
