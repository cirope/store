require 'test_helper'

class Reports::CommoditiesControllerTest < ActionController::TestCase
  setup do
    login
  end

  test 'should get receipt index' do
    get :index, voucher: 'receipt',
      start: I18n.l(2.months.ago.to_date),
      finish: I18n.l(Time.zone.today)

    assert_response :success
  end

  test 'should get invoice index' do
    get :index, voucher: 'invoice',
      start: I18n.l(2.months.ago.to_date),
      finish: I18n.l(Time.zone.today)

    assert_response :success
  end
end
