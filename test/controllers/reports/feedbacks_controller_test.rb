require 'test_helper'

class Reports::FeedbacksControllerTest < ActionController::TestCase
  setup do
    login
  end

  test 'should get index' do
    get :index,
      start: I18n.l(2.months.ago.to_date),
      finish: I18n.l(Time.zone.today)

    assert_response :success
  end
end
