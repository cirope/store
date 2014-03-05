require 'test_helper'

class PurchasesTest < ActionDispatch::IntegrationTest
  include EntitiesTestHelper
  include CityTestHelper

  test 'should create a purchase' do
    book = books :cirope_sa_p
    login

    visit new_book_purchase_path(book)
    fill_in_new_purchase

    assert_difference 'book.purchases.count' do
      find('.btn.btn-primary').click
    end
  end

  test 'should create a new provider' do
    login

    visit new_book_purchase_path(books(:cirope_sa_a))

    add_provider
  end

  private

    def fill_in_new_purchase
      provider = providers(:arcor)

      page.execute_script "$('#purchase_provider').focus().val('#{provider.name}').keydown()"

      find('.ui-autocomplete li.ui-menu-item').click

      page.execute_script "$('#purchase_requested_at').focus()"

      find('.ui-datepicker .ui-state-highlight').click
    end

    def add_provider
      find("a[href='#{new_provider_path}']").click

      within '#modal' do
        fill_in_new_provider
      end

      assert find_field('purchase_provider').value.blank?

      assert_difference 'Provider.count' do
        find('#modal .btn.btn-primary').click
        assert page.has_no_css?('#modal')
      end

      assert find_field('purchase_provider').value.present?
    end

    def fill_in_new_provider
      attributes = generic_entity_attributes

      fill_in find('input[name$="[name]"]')[:id], with: attributes[:name]
      fill_in find('input[name$="[tax_id]"]')[:id], with: attributes[:tax_id]
      select I18n.t("entities.conditions.#{attributes[:tax_condition]}"),
        from: find('select[name$="[tax_condition]"]')[:id]
      fill_in find('input[name$="[address]"]')[:id], with: attributes[:address]

      add_city
    end
end
