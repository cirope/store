module Books::Scopes
  extend ActiveSupport::Concern

  included do
    scope :income,  -> { where flow: 'income' }
    scope :outcome, -> { where flow: 'outcome' }
  end
end
