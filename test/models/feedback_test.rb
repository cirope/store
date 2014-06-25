require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def setup
    @feedback = feedbacks :positive
  end

  test 'validates blank attributes' do
    @feedback.owner = nil
    @feedback.customer = nil

    assert @feedback.invalid?
    assert_error @feedback, :owner, :blank
    assert_error @feedback, :customer, :blank
  end

  test 'validates attributes inclusion' do
    @feedback.score = 'invalid'

    assert @feedback.invalid?
    assert_error @feedback, :score, :inclusion
  end

  test 'validates notes presence' do
    feedback = Feedback.create! @feedback.dup.attributes.merge(notes: nil)

    assert feedback.invalid?
    assert_error feedback, :notes, :blank
  end

  test 'from token' do
    assert_equal @feedback, Feedback.from_token(@feedback.token)
    assert_raise(ActiveRecord::RecordNotFound) { Feedback.from_token 'no way' }
  end

  test 'by score' do
    score = Feedback::SCORES.first

    assert_equal Feedback.where(score: score), Feedback.by_score(score)
  end

  test 'stats' do
    assert Feedback.stats(start: 1.month.ago.to_date).values.sum > 0
  end

  test 'with receipts between' do
    feedbacks = Feedback.with_receipts_between 1.day.ago, Time.now

    assert feedbacks.any?
    assert feedbacks.map(&:owner).all? { |o| o.issued_at.between?(1.day.ago, Time.now) }

    feedbacks.map(&:owner).each { |o| o.update! issued_at: 5.day.ago }

    assert feedbacks.reload.empty?
  end

  test 'current step' do
    feedback = Feedback.new

    assert_equal 'score', feedback.current_step

    feedback.score = Feedback::SCORES.first

    assert_equal 'notes', feedback.current_step

    feedback.notes = 'Some note'

    assert_equal 'thanks', feedback.current_step
  end
end
