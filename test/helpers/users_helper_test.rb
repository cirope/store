require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  test 'user relations' do
    @user = users :franco

    assert_equal [relations(:franco_cirope)], user_relations

    @user = User.new

    assert_equal 1, user_relations.size
    assert user_relations.all?(&:new_record?)
  end

  test 'render organization list' do
    @user = users :franco

    assert_match /<ul/, render_organization_list
  end

  test 'should not render organization list' do
    @user = User.new

    assert render_organization_list.blank?
  end
end
