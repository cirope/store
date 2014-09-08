require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = tags :important
  end

  test 'blank attributes' do
    @tag.name = ''

    assert @tag.invalid?
    assert_error @tag, :name, :blank
  end

  test 'unique attributes' do
    tag = @tag.dup

    assert tag.invalid?
    assert_error tag, :name, :taken
  end
end
