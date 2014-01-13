require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  test 'user relations' do
    @user = users :franco

    assert_equal [relations(:franco_cirope)], user_relations

    @user = User.new

    assert_equal 1, user_relations.size
    assert user_relations.all?(&:new_record?)
  end
end
