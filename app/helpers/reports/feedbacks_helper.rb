module Reports::FeedbacksHelper
  def feedback_count score
    count = @feedback_stats[score] || 0

    link_to_if count > 0, count, feedbacks_path(score: score)
  end

  def feedbacks_path_with_params parameters = {}
    feedbacks_path request.query_parameters.merge(parameters)
  end

  def feedback_color score
    { 'great' => '#5cb85c', 'good' => '#428bca', 'poor' => '#d9534f' }[score]
  end
end
