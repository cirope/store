require 'test_helper'

class RelationTest < ActiveSupport::TestCase
  def setup
    @relation = relations(:franco_cirope)
  end

  test 'blank attributes' do
    @relation.organization = nil

    assert @relation.invalid?
    assert_error @relation, :organization, :blank
  end

  test 'unique attributes' do
    relation = Relation.new(
      organization_id: @relation.organization_id,
      user_id: @relation.user_id
    )

    assert relation.invalid?
    assert_error relation, :organization_id, :taken
  end
end
