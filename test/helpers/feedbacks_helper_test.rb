require 'test_helper'

class FeedbacksHelperTest < ActionView::TestCase
  test 'scores' do
    assert_respond_to feedback_scores, :each
  end

  test 'feedback scores' do
    assert_equal I18n.t('feedbacks.scores.good'), feedback_score('good')
  end

  test 'update feedback path' do
    @feedback = feedbacks :positive

    assert_match /good/, update_feedback_path('good')
  end
end
