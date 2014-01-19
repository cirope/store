require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  def setup
    @entity = entities :havanna
  end

  test 'blank attributes' do
    @entity.tax_id = ''
    @entity.tax_situation = ''
    @entity.name = ''
    @entity.city_id = nil

    assert @entity.invalid?
    assert_error @entity, :tax_id, :blank
    assert_error @entity, :tax_situation, :blank
    assert_error @entity, :name, :blank
    assert_error @entity, :city_id, :blank
  end

  test 'unique attributes' do
    entity = Entity.new @entity.dup.attributes

    assert entity.invalid?
    assert_error entity, :tax_id, :taken
    assert_error entity, :name, :taken
  end

  test 'attributes length' do
    @entity.tax_id = 'abcde' * 52
    @entity.tax_situation = 'abcde' * 52
    @entity.name = 'abcde' * 52

    assert @entity.invalid?
    assert_error @entity, :tax_id, :too_long, count: 255
    assert_error @entity, :tax_situation, :too_long, count: 255
    assert_error @entity, :name, :too_long, count: 255
  end
end
