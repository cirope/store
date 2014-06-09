require 'test_helper'

class EntitiesHelperTest < ActionView::TestCase
  test 'tax conditions' do
    conditions = tax_conditions

    assert_kind_of Array, conditions
    assert_equal Entity::TAX_CONDITIONS.size, conditions.size
  end

  test 'city label' do
    label = city_label

    assert_kind_of String, label
    assert_match /<a .*>/, label
  end

  test 'city select' do
    simple_fields_for(Entity.new) do |f|
      assert_match /<select/, city_select(f)
    end
  end

  test 'entity phones' do
    entity = entities :cirope_sa

    assert_equal entity.phones, entity_phones(entity)

    entity = Entity.new

    assert_equal 1, entity_phones(entity).size
    assert entity_phones(entity).all?(&:new_record?)
  end

  private

    # Stub of state helper method
    def states_and_cities
      State.ordered.includes :cities
    end
end
