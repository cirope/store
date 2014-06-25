require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  setup do
    @feedback = feedbacks :positive

    Account.current_id = @feedback.account_id
    @request.host = "#{@feedback.account.subdomain}.lvh.me"
  end

  test 'should get index' do
    login

    get :index, score: Feedback::SCORES.first
    assert_response :success
    assert_not_nil assigns(:feedbacks)
    assert assigns(:feedbacks).any?
  end

  test 'should get filtered index' do
    login

    get :index, score: Feedback::SCORES.first,
      start:  I18n.l(2.days.from_now.to_date),
      finish: I18n.l(4.days.from_now.to_date)
    assert_response :success
    assert_not_nil assigns(:feedbacks)
    assert assigns(:feedbacks).empty?
  end

  test 'should show feedback' do
    login

    get :show, id: @feedback
    assert_response :success
  end

  test 'should get edit in score' do
    feedback = Feedback.create! @feedback.dup.attributes.merge(score: nil, notes: nil)

    get :edit, id: feedback
    assert_response :success
    assert_template 'feedbacks/_score'
  end

  test 'should get edit in notes' do
    feedback = Feedback.create! @feedback.dup.attributes.merge(notes: nil)

    get :edit, id: feedback
    assert_response :success
    assert_template 'feedbacks/_notes'
  end

  test 'should get edit in thanks' do
    get :edit, id: @feedback
    assert_response :success
    assert_template 'feedbacks/_thanks'
  end

  test 'should update feedback' do
    patch :update, id: @feedback, feedback: { notes: 'New notes' }
    assert_redirected_to edit_feedback_url(assigns(:feedback))
  end
end
