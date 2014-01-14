require 'test_helper'

class StateTest < ActiveSupport::TestCase
  def setup
    set_current_organization

    @state = states(:mendoza)
  end

  test 'blank attributes' do
    @state.name = ''
    @state.organization = nil

    assert @state.invalid?
    assert_error @state, :name, :blank
    assert_error @state, :organization, :blank
  end

  test 'unique attributes' do
    state = State.new name: @state.name

    assert state.invalid?
    assert_error state, :name, :taken
  end

  test 'attributes length' do
    @state.name = 'abcde' * 52

    assert @state.invalid?
    assert_error @state, :name, :too_long, count: 255
  end
end
