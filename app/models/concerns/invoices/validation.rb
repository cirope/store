module Invoices::Validation
  extend ActiveSupport::Concern

  included do
    validates :customer, :issued_at, presence: true
    validates :issued_at, timeliness: { type: :date }
    validate :issued_in_sequence
  end

  private

    def issued_in_sequence
      errors.add :issued_at, :invalid if issued_in_sequence?
    end

    def issued_in_sequence?
      last_issued_at && issued_at && issued_at < last_issued_at
    end

    def last_issued_at
      previous_invoices = self.class.where('number < ?', number).order 'issued_at'
      @_last_issued_at ||= previous_invoices.last.try :issued_at
    end
end
