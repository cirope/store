require 'test_helper'

class AutocompleteInputTest < ActionView::TestCase
  test 'input' do
    simple_fields_for(Relation.new) do |f|
      input = f.input :organization, as: :autocomplete, url: organizations_url

      assert_match /data-autocomplete-url/, input
    end
  end
end
