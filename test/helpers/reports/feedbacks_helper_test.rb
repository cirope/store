require 'test_helper'

class Reports::FeedbacksHelperTest < ActionView::TestCase
  test 'feedback count' do
    @feedback_stats = { 'good' => 1 }

    assert_match    /href/, feedback_count('good')
    assert_no_match /href/, feedback_count('poor')
  end

  test 'feedback path with params' do
    request.query_parameters.merge! test: 'param'

    assert_match /test=param/, feedbacks_path_with_params(score: 'good')
  end

  test 'feedback color' do
    colors = Feedback::SCORES.map { |s| feedback_color s }

    assert_equal Feedback::SCORES.size, colors.uniq.size
  end

  private

    def request
      @request ||= ActionDispatch::TestRequest.new
    end
end
