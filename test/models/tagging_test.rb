require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  def setup
    @tagging = taggings :important
  end

  test 'blank attributes' do
    @tagging.tag_id = ''

    assert @tagging.invalid?
    assert_error @tagging, :tag_id, :blank
  end

  test 'unique attributes' do
    tagging = @tagging.dup

    assert tagging.invalid?
    assert_error tagging, :tag_id, :taken
  end
end
