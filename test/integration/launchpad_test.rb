require 'test_helper'

class LaunchpadTest < ActionDispatch::IntegrationTest
  test 'add book' do
    login

    visit launchpad_path

    assert page.has_no_css?('[data-income-books]', text: I18n.t('books.kinds.B'))

    organization = organizations :cirope_sa
    find("a[href='#{new_organization_book_path(organization, flow: 'income')}']").click

    within '#modal' do
      fill_in_new_book
    end

    assert_difference 'Book.income.count' do
      find('#modal .btn.btn-primary').click
      assert page.has_no_css?('#modal')
    end

    assert page.has_css?('[data-income-books]', text: I18n.t('books.kinds.B'))
  end

  private

    def fill_in_new_book
      select I18n.t('books.kinds.B'), from: 'book_kind'
      fill_in 'book_last_used_number', with: '0'
    end
end
