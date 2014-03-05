require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  def setup
    @purchase = purchases :first_purchase
  end

  test 'blank attributes' do
    @purchase.number = ''
    @purchase.provider = nil
    @purchase.requested_at = nil

    assert @purchase.invalid?
    assert_error @purchase, :number, :blank
    assert_error @purchase, :provider, :blank
    assert_error @purchase, :requested_at, :blank
  end

  test 'unique attributes' do
    purchase = @purchase.dup
    @purchase.book.update! last_used_number: @purchase.number - 1

    assert purchase.invalid?
    assert_error purchase, :number, :taken
  end

  test 'date validations' do
    @purchase.requested_at = '13/13/13'
    @purchase.delivered_at = '13/13/13'

    assert @purchase.invalid?
    assert_error @purchase, :requested_at, :invalid_date
    assert_error @purchase, :delivered_at, :invalid_date
  end

  test 'date boundaries validation' do
    @purchase.delivered_at = @purchase.requested_at - 1.day

    assert @purchase.invalid?
    assert_error @purchase, :delivered_at, :on_or_after, restriction: I18n.l(@purchase.requested_at)
  end

  test 'assign number after validate' do
    purchase = @purchase.dup
    purchase.number = nil

    assert purchase.valid?
    assert_not_nil purchase.number
  end

  test 'assign maker on creation' do
    User.current_id = users(:franco).id
    purchase = @purchase.dup
    purchase.maker_id = nil

    assert purchase.valid?
    assert_equal User.current_id, purchase.maker_id
  end

  test 'assign receiver on delivered_at update' do
    User.current_id = users(:franco).id

    @purchase.delivered_at = Time.zone.today

    assert @purchase.valid?
    assert_equal User.current_id, @purchase.receiver_id
  end

  test 'assign no receiver on another attribute update' do
    User.current_id = users(:franco).id

    @purchase.provider_id = @purchase.provider_id

    assert @purchase.valid?
    assert_nil @purchase.receiver
  end
end
