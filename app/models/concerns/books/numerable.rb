module Books::Numerable
  extend ActiveSupport::Concern

  included do
    attr_readonly :number

    before_validation :assign_number, on: :create
    before_create :consume_next_number
    after_rollback :return_number

    validates :number, presence: true, uniqueness: { scope: :book_id }

    belongs_to :book
  end

  def assign_number
    self.number = book.next_available_number
  end

  def consume_next_number
    self.number = book.next_number
  end

  def return_number
    book.return_number
  end
end
