module Items::Validation
  extend ActiveSupport::Concern

  included do
    before_validation :replace_price_punctuation

    validates :name, :code, :unit, presence: true, length: { maximum: 255 }
    validates :code, uniqueness: { case_sensitive: false, scope: :account_id }
    validates :price, presence: true, numericality: {
      greater_than_or_equal_to: 0, less_than: 9_999_999_999_999.99
    }
  end

  private

  def replace_price_punctuation
    self.price = price_before_type_cast.to_s.sub ',', '.'
  end
end
