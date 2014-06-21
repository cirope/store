require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  setup do
    @feedback = feedbacks :positive

    Account.current_id = @feedback.account_id
    @request.host = "#{@feedback.account.subdomain}.lvh.me"
  end

  test 'should get index' do
    login

    get :index
    assert_response :success
    assert_not_nil assigns(:feedbacks)
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
