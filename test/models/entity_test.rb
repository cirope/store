require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  def setup
    @entity = entities :havanna
  end

  test 'blank attributes' do
    @entity.tax_id = ''
    @entity.tax_condition = ''
    @entity.name = ''
    @entity.city_id = nil

    assert @entity.invalid?
    assert_error @entity, :tax_id, :blank
    assert_error @entity, :tax_condition, :blank
    assert_error @entity, :name, :blank
    assert_error @entity, :city_id, :blank
  end

  test 'tax id presence' do
    @entity.tax_id = ''
    @entity.tax_condition = 'mono_tax'

    assert @entity.invalid?
    assert_error @entity, :tax_id, :blank

    @entity.tax_condition = 'final_consumer'

    assert @entity.valid?
  end

  test 'unique attributes' do
    entity = @entity.dup

    assert entity.invalid?
    assert_error entity, :tax_id, :taken
    assert_error entity, :name, :taken
  end

  test 'attributes length' do
    @entity.tax_id = 'abcde' * 52
    @entity.tax_condition = 'abcde' * 52
    @entity.name = 'abcde' * 52

    assert @entity.invalid?
    assert_error @entity, :tax_id, :too_long, count: 255
    assert_error @entity, :tax_condition, :too_long, count: 255
    assert_error @entity, :name, :too_long, count: 255
  end

  test 'included attributes' do
    @entity.tax_condition = 'wrong'

    assert @entity.invalid?
    assert_error @entity, :tax_condition, :inclusion
  end

  test 'issuable receipts' do
    assert_equal Entity::ISSUABLE_RECEIPTS[@entity.tax_condition],
      @entity.issuable_receipts
  end

  test 'email format' do
    @entity.email = 'wrong@format'

    assert @entity.invalid?
    assert_error @entity, :email, :invalid
  end
end
