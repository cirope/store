# Preview all emails at http://localhost:3000/rails/mailers/feedback_mailer
class FeedbackMailerPreview < ActionMailer::Preview
  def feedback
    FeedbackMailer.feedback Feedback.unscoped.first
  end
end
