require 'test_helper'

class CityTest < ActiveSupport::TestCase
  def setup
    set_current_account

    @city = cities(:rivadavia)
  end

  test 'blank attributes' do
    @city.name = ''
    @city.zip_code = ''
    @city.state = nil
    @city.account = nil

    assert @city.invalid?
    assert_error @city, :name, :blank
    assert_error @city, :zip_code, :blank
    assert_error @city, :state, :blank
    assert_error @city, :account, :blank
  end

  test 'unique attributes' do
    city = City.new(
      name: @city.name,
      zip_code: @city.zip_code,
      account_id: @city.account_id,
      state_id: @city.state_id
    )

    assert city.invalid?
    assert_error city, :name, :taken
    assert_error city, :zip_code, :taken
  end

  test 'attributes length' do
    @city.name = 'abcde' * 52
    @city.zip_code = 'abcde' * 52

    assert @city.invalid?
    assert_error @city, :name, :too_long, count: 255
    assert_error @city, :zip_code, :too_long, count: 255
  end
end
