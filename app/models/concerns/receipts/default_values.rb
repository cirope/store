module Receipts::DefaultValues
  extend ActiveSupport::Concern

  def issued_at
    super || (Time.zone.today if new_record?)
  end
end
