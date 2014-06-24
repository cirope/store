require 'test_helper'

class Reports::FeedbacksHelperTest < ActionView::TestCase
  test 'feedback count' do
    @feedback_stats = { 'good' => 1 }

    assert_match    /href/, feedback_count('good')
    assert_no_match /href/, feedback_count('poor')
  end
end
