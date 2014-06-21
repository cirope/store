module FeedbacksHelper
  def feedback_scores
    Feedback::SCORES
  end

  def feedback_score score
    t "feedbacks.scores.#{score}"
  end

  def update_feedback_path score
    feedback_path @feedback, feedback: { score: score }
  end
end
