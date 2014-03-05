require 'test_helper'

class PurchasesTest < ActionDispatch::IntegrationTest
  test 'should create a purchase' do
    book = books :cirope_sa_p
    login

    visit new_book_purchase_path(book)
    fill_in_new_purchase

    assert_difference 'book.purchases.count' do
      find('.btn.btn-primary').click
    end
  end

  private

    def fill_in_new_purchase
      provider = providers(:arcor)

      page.execute_script "$('#purchase_provider').focus().val('#{provider.name}').keydown()"

      find('.ui-autocomplete li.ui-menu-item').click

      page.execute_script "$('#purchase_requested_at').focus()"

      find('.ui-datepicker .ui-state-highlight').click
    end
end
