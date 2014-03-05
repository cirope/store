require 'test_helper'

class InvoicesTest < ActionDispatch::IntegrationTest
  include EntitiesTestHelper
  include CityTestHelper

  test 'should create a invoice' do
    book = books :cirope_sa_a
    login

    visit new_book_invoice_path(book)
    fill_in_new_invoice

    add_item items(:candy), 1
    add_item items(:chocolate), 2

    assert_difference 'book.invoices.count' do
      assert_difference 'InvoiceItem.count', 2 do
        find('.btn.btn-primary').click
      end
    end
  end

  test 'should remove invoice relations' do
    invoice = invoices(:first_sale)

    login

    visit edit_invoice_path(invoice)

    page.find('#invoice_items fieldset:nth-child(1)').hover

    within '#invoice_items fieldset:nth-child(1)' do
      find('a[data-dynamic-form-event="hideItem"]').click
    end

    assert_difference 'invoice.invoice_items.count', -1 do
      find('.btn.btn-primary').click
    end
  end

  test 'should create a new customer' do
    login

    visit new_book_invoice_path(books(:cirope_sa_a))

    add_customer
  end

  private

    def fill_in_new_invoice
      customer = customers(:havanna)

      page.execute_script "$('#invoice_customer').focus().val('#{customer.name}').keydown()"

      find('.ui-autocomplete li.ui-menu-item').click
    end

    def add_item item, index
      click_link I18n.t('invoices.new.item') if index > 1

      within "#invoice_items fieldset:nth-child(#{index})" do
        input_id = find('input[name$="[item]"]')[:id]
        page.execute_script "$('##{input_id}').focus().val('#{item.name}').keydown()"

        fill_in find('input[name$="[quantity]"]')[:id], with: '1'
        # Price MUST be filled automatically
      end

      find('.ui-autocomplete li.ui-menu-item').click
    end

    def add_customer
      find("a[href='#{new_customer_path}']").click

      within '#modal' do
        fill_in_new_customer
      end

      assert find_field('invoice_customer').value.blank?

      assert_difference 'Customer.count' do
        find('#modal .btn.btn-primary').click
        assert page.has_no_css?('#modal')
      end

      assert find_field('invoice_customer').value.present?
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
end
