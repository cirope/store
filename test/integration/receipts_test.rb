require 'test_helper'

class ReceiptsTest < ActionDispatch::IntegrationTest
  include EntitiesTestHelper
  include CommodityTestHelper

  test 'should create a receipt' do
    book = books :cirope_sa_x
    login

    visit new_book_receipt_path(book)
    fill_in_new_receipt

    add_commodity commodities(:candy), 1
    add_commodity commodities(:chocolate), 2

    assert_difference 'book.receipts.count' do
      assert_difference 'ReceiptCommodity.count', 2 do
        assert_difference 'Bound.count', 2 do
          assert_difference 'Use.count', 2 do
            find('.btn.btn-primary').click
          end
        end
      end
    end
  end

  test 'should remove receipt relations' do
    receipt = receipts :first_receipt

    login

    visit edit_receipt_path(receipt)

    page.find('#receipt_commodities fieldset:nth-child(1)').hover

    within '#receipt_commodities fieldset:nth-child(1)' do
      find('a[data-dynamic-form-event="hideItem"]').click
    end

    assert_difference 'receipt.receipt_commodities.count', -1 do
      find('.btn.btn-primary').click
    end
  end

  test 'should create a new customer' do
    login

    visit new_book_receipt_path(books(:cirope_sa_x))

    add_customer
  end

  test 'should add new item' do
    book = books :cirope_sa_x
    login

    visit new_book_receipt_path(book)
    fill_in_new_receipt

    add_new_commodity prefix: 'receipt_receipt_commodities'
  end

  test 'should add new service' do
    book = books :cirope_sa_x
    login

    visit new_book_receipt_path(book)
    fill_in_new_receipt

    add_new_commodity type: Service, prefix: 'receipt_receipt_commodities'
  end

  test 'should calculate receipt total' do
    book = books :cirope_sa_x
    login

    visit new_book_receipt_path(book)
    fill_in_new_receipt

    add_commodity commodities(:candy), 1
    add_commodity commodities(:chocolate), 2

    expected_total = commodities(:candy).price + commodities(:chocolate).price
    page.execute_script '$("[data-chargeable-changer]").keyup()'

    assert page.has_css?('[data-chargeable-total]', text: '%.2f' % expected_total)
  end

  test 'should disable ask for feedback if customer has no email' do
    book = books :cirope_sa_x
    customer = customers :havanna

    login

    customer.update email: nil

    visit new_book_receipt_path(book)

    assert !find('#ask_for_feedback').disabled?

    page.execute_script "$('#receipt_customer').focus().val('#{customer.name}').keydown()"

    find('.ui-autocomplete li.ui-menu-item').click

    assert find('#ask_for_feedback').disabled?
  end

  private

    def fill_in_new_receipt
      customer = customers :havanna

      page.execute_script "$('#receipt_customer').focus().val('#{customer.name}').keydown()"

      find('.ui-autocomplete li.ui-menu-item').click
    end

    def add_commodity commodity, index
      click_link I18n.t('receipts.new.commodity') if index > 1

      within "fieldset.receipt_commodity:nth-child(#{index})" do
        input_id = find('input[name$="[commodity]"]')[:id]
        page.execute_script "$('##{input_id}').focus().val('#{commodity.name}').keydown()"

        fill_in find('input[name$="[quantity]"]')[:id], with: '1'
      end

      find('.ui-autocomplete li.ui-menu-item').click

      add_bounds index if index > 1
    end

    def add_bounds index
      page.find("fieldset.receipt_commodity:nth-child(#{index})").hover

      within "fieldset.receipt_commodity:nth-child(#{index})" do
        find('.glyphicon-user').click
        assert page.has_css?('.bound')
      end

      add_bound 1
      add_bound 2

      within "fieldset.receipt_commodity:nth-child(#{index})" do
        find('.glyphicon-user').click
        assert page.has_no_css?('.bound')
      end
    end

    def add_bound index
      click_link I18n.t('receipt_commodities.new.bound') if index > 1
      user = users :franco

      within "fieldset.bound:nth-child(#{index})" do
        fill_in find('input[name$="[notes]"]')[:id], with: 'note...'
        fill_in find('input[name$="[duration]"]')[:id], with: '30'

        input_id = find('input[name$="[user]"]')[:id]
        page.execute_script "$('##{input_id}').focus().val('#{user.name}').keydown()"
      end

      find('.ui-autocomplete li.ui-menu-item').click

      add_uses index if index > 1
    end

    def add_uses index
      page.find("fieldset.bound:nth-child(#{index})").hover

      within "fieldset.bound:nth-child(#{index})" do
        find('.glyphicon-shopping-cart').click
        assert page.has_css?('.use')
      end

      add_use 1
      add_use 2

      page.find("fieldset.bound:nth-child(#{index})").hover

      within "fieldset.bound:nth-child(#{index})" do
        find('.glyphicon-shopping-cart').click
        assert page.has_no_css?('.use')
      end
    end

    def add_use index
      click_link I18n.t('bounds.new.use') if index > 1
      item = items :chocolate

      within "fieldset.use:nth-child(#{index})" do
        fill_in find('input[name$="[quantity]"]')[:id], with: '3'

        input_id = find('input[name$="[item]"]')[:id]
        page.execute_script "$('##{input_id}').focus().val('#{item.name}').keydown()"
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
      fill_in find('input[name$="[birth]"]')[:id], with: I18n.l(Time.zone.yesterday)

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
