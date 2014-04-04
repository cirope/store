module Accounts::Relations
  extend ActiveSupport::Concern

  included do
    has_many :books, dependent: :destroy
    has_many :commodities
    has_many :items, through: :commodities, source: :classification, source_type: 'Item', dependent: :destroy
    has_many :customers, dependent: :destroy
    has_many :organizations, dependent: :destroy
    has_many :states, dependent: :destroy
    has_many :users, dependent: :destroy
  end
end
