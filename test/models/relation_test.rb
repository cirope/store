require 'test_helper'

class RelationTest < ActiveSupport::TestCase
  def setup
    @relation = relations(:franco_cirope)
  end

  test 'blank attributes' do
    @relation.account = nil

    assert @relation.invalid?
    assert_error @relation, :account, :blank
  end

  test 'unique attributes' do
    relation = Relation.new(
      account_id: @relation.account_id,
      user_id: @relation.user_id
    )

    assert relation.invalid?
    assert_error relation, :account_id, :taken
  end
end
