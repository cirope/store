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
end
