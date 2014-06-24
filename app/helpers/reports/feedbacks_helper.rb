module Reports::FeedbacksHelper
  def feedback_count score
    count = @feedback_stats[score] || 0

    link_to_if count > 0, count, feedbacks_path(score: score)
  end
end
