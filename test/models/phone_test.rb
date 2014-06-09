require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  def setup
    @phone = phones :cirope_sa
  end

  test 'blank attributes' do
    @phone.phone = ''

    assert @phone.invalid?
    assert_error @phone, :phone, :blank
  end

  test 'attributes length' do
    @phone.phone = 'abcde' * 52

    assert @phone.invalid?
    assert_error @phone, :phone, :too_long, count: 255
  end
end
