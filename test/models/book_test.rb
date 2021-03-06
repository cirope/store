require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @book = books :cirope_sa_a
  end

  test 'blank attributes' do
    @book.kind = ''

    assert @book.invalid?
    assert_error @book, :kind, :blank
  end

  test 'attributes length' do
    @book.kind = 'abcde' * 52

    assert @book.invalid?
    assert_error @book, :kind, :too_long, count: 255
  end

  test 'attributes inclusion' do
    @book.kind = 'Y'

    assert @book.invalid?
    assert_error @book, :kind, :inclusion

    @book.reload
    @book.flow = 'wrong'

    assert @book.invalid?
    assert_error @book, :flow, :inclusion
  end

  test 'validates inclusion by flow' do
    @book.kind = 'P'

    assert @book.invalid?
    assert_error @book, :kind, :inclusion

    @book.flow = 'outcome'
    assert @book.valid?
  end

  test 'numeric attributes' do
    @book.last_used_number = '12x'

    assert @book.invalid?
    assert_error @book, :last_used_number, :not_a_number
  end

  test 'next available number' do
    assert_equal @book.last_used_number.next, @book.next_available_number
  end

  test 'next number' do
    assert_difference '@book.reload.last_used_number', 1 do
      assert @book.last_used_number.next, @book.next_number
    end
  end

  test 'return number' do
    last_used_number = @book.next_number

    @book.return_number

    assert_equal last_used_number.pred, @book.reload.last_used_number
  end

  test 'can not return number' do
    book = Book.find @book.id

    @book.next_number
    last_used_number = book.next_number

    assert_raise(RuntimeError) { @book.return_number }
    assert_equal last_used_number, @book.reload.last_used_number
  end

  test 'kind class' do
    assert_equal Invoice, @book.kind_class

    @book = books :cirope_sa_x

    assert_equal Receipt, @book.kind_class

    @book = books :cirope_sa_p

    assert_equal Purchase, @book.kind_class
  end

  test 'sheets' do
    assert_equal @book.invoices, @book.sheets

    @book = books :cirope_sa_x

    assert_equal @book.receipts, @book.sheets

    @book = books :cirope_sa_p

    assert_equal @book.purchases, @book.sheets
  end

  test 'valid kinds' do
    assert_equal @book.organization.issuable_receipts, @book.valid_kinds

    @book = books :cirope_sa_p

    assert_equal ['P'], @book.valid_kinds
  end

  test 'sheets count by customer' do
    customer = customers :havanna
    expected_count = @book.sheets.where(customer_id: customer.id).count

    assert_equal expected_count, @book.sheets_count_by_customer(customer)
  end
end
