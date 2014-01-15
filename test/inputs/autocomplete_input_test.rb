require 'test_helper'

class AutocompleteInputTest < ActionView::TestCase
  test 'input' do
    simple_fields_for(Relation.new) do |f|
      input = f.input :account, as: :autocomplete, url: accounts_url

      assert_match /data-autocomplete-url/, input
    end
  end
end
