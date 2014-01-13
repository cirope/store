require 'test_helper'

class DynamicFormHelperTest < ActionView::TestCase
  test 'link to add fields' do
    simple_fields_for(User.new) do |f|
      link = link_to_add_fields 'Add relation', f, :relations

      assert_match /addNestedItem/, link
    end
  end

  test 'link to remove nested item' do
    simple_fields_for(Relation.new) do |f|
      link = link_to_remove_nested_item f

      assert_match /removeItem/, link
    end
  end

  test 'link to hide nested item' do
    simple_fields_for(relations(:franco_cirope)) do |f|
      link = link_to_remove_nested_item f

      assert_match /hideItem/, link
    end
  end
end
