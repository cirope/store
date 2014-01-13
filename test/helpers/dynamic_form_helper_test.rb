require 'test_helper'

class DynamicFormHelperTest < ActionView::TestCase
  test 'link to add fields' do
    link = nil

    simple_fields_for(User.new) do |f|
      link = link_to_add_fields 'Add relation', f, :relations
    end

    assert_match /addNestedItem/, link
  end

  test 'link to remove nested item' do
    link = nil

    simple_fields_for(Relation.new) do |f|
      link = link_to_remove_nested_item f
    end

    assert_match /removeItem/, link
  end

  test 'link to hide nested item' do
    link = nil

    simple_fields_for(relations(:franco_cirope)) do |f|
      link = link_to_remove_nested_item f
    end

    assert_match /hideItem/, link
  end
end
