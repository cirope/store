module Accounts::Relations
  extend ActiveSupport::Concern

  included do
    has_many :books, dependent: :destroy
    has_many :customers, dependent: :destroy
    has_many :items, dependent: :destroy
    has_many :organizations, dependent: :destroy
    has_many :states, dependent: :destroy
    has_many :users, dependent: :destroy
    has_many :warehouses, dependent: :destroy
  end
end
