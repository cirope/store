require 'test_helper'

class ReceiptsTest < ActionDispatch::IntegrationTest
  include EntitiesTestHelper

  test 'should create a receipt' do
    book = books :cirope_sa_x
    login

    visit new_book_receipt_path(book)
    fill_in_new_receipt

    add_item items(:candy), 1
    add_item items(:chocolate), 2

    assert_difference 'book.receipts.count' do
      assert_difference 'ReceiptItem.count', 2 do
        find('.btn.btn-primary').click
      end
    end
  end

  test 'should remove receipt relations' do
    receipt = receipts(:first_receipt)

    login

    visit edit_receipt_path(receipt)

    page.find('#receipt_items fieldset:nth-child(1)').hover

    within '#receipt_items fieldset:nth-child(1)' do
      find('a[data-dynamic-form-event="hideItem"]').click
    end

    assert_difference 'receipt.receipt_items.count', -1 do
      find('.btn.btn-primary').click
    end
  end

  test 'should create a new customer' do
    login

    visit new_book_receipt_path(books(:cirope_sa_x))

    add_customer
  end

  private

    def fill_in_new_receipt
      customer = customers(:havanna)

      page.execute_script "$('#receipt_customer').focus().val('#{customer.name}').keydown()"

      find('.ui-autocomplete li.ui-menu-item').click
    end

    def add_item item, index
      click_link I18n.t('receipts.new.item') if index > 1

      within "#receipt_items fieldset:nth-child(#{index})" do
        input_id = find('input[name$="[item]"]')[:id]
        page.execute_script "$('##{input_id}').focus().val('#{item.name}').keydown()"

        fill_in find('input[name$="[quantity]"]')[:id], with: '1'
      end

      find('.ui-autocomplete li.ui-menu-item').click
    end

    def add_customer
      find("a[href='#{new_customer_path}']").click

      within '#modal' do
        fill_in_new_customer
      end

      assert find_field('receipt_customer').value.blank?

      assert_difference 'Customer.count' do
        find('#modal .btn.btn-primary').click
        assert page.has_no_css?('#modal')
      end

      assert find_field('receipt_customer').value.present?
    end

    def fill_in_new_customer
      attributes = generic_entity_attributes

      fill_in find('input[name$="[name]"]')[:id], with: attributes[:name]
      fill_in find('input[name$="[tax_id]"]')[:id], with: attributes[:tax_id]
      select I18n.t("entities.conditions.#{attributes[:tax_condition]}"),
        from: find('select[name$="[tax_condition]"]')[:id]
      fill_in find('input[name$="[address]"]')[:id], with: attributes[:address]

      add_city
    end

    def add_city
      find("a[href='#{new_city_path}']").click

      fill_in_new_city

      assert_difference 'City.count' do
        find('form.new_city .btn.btn-primary').click
        assert page.has_no_css?('form.new_city')
      end

      assert page.has_css?('select[name$="[city_id]"] option[selected]', text: 'Villa Mercedes')
    end

    def fill_in_new_city
      fill_in 'city_name', with: 'Villa Mercedes'
      fill_in 'city_zip_code', with: '5730'

      add_state
    end

    def add_state
      find("a[href='#{new_state_path}']").click

      fill_in 'state_name', with: 'San Luis'

      assert_difference 'State.count' do
        find('form.new_state .btn.btn-primary').click
        assert page.has_no_css?('form.new_state')
      end

      assert page.has_css?('select[name$="[state_id]"] option[selected]', text: 'San Luis')
    end
end
