require 'test_helper'

class ReceiptsTest < ActionDispatch::IntegrationTest
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

    within '#receipt_items fieldset:nth-child(1)' do
      find('a[data-dynamic-form-event="hideItem"]').click
    end

    assert_difference 'receipt.receipt_items.count', -1 do
      find('.btn.btn-primary').click
    end
  end

  private

    def fill_in_new_receipt
      select customers(:havanna).name, from: 'receipt_customer_id'
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
end
