module Books::Numerable
  extend ActiveSupport::Concern

  included do
    attr_readonly :number

    before_validation :assign_number, on: :create

    validates :number, presence: true, uniqueness: { scope: :book_id }

    belongs_to :book
  end

  def assign_number
    self.number = book.next_number
  end
end
