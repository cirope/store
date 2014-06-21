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
    assert_nil Feedback.from_token('no way')
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
