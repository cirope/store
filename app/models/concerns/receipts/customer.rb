module Receipts::Customer
  extend ActiveSupport::Concern

  included do
    delegate :entity, :email, to: :customer, prefix: true

    belongs_to :customer
  end

  def customer_has_email?
    customer_email.present?
  end
end
