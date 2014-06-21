require 'test_helper'

class FeedbackMailerTest < ActionMailer::TestCase
  test 'feedback' do
    feedback = feedbacks :positive
    mail = FeedbackMailer.feedback feedback

    assert_equal I18n.t('feedback_mailer.feedback.subject'), mail.subject
    assert_equal [feedback.customer_email], mail.to
    assert_equal 3, mail.attachments.size
  end
end
