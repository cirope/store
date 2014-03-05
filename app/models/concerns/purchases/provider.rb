module Purchases::Provider
  extend ActiveSupport::Concern

  included do
    delegate :entity, to: :provider, prefix: true

    belongs_to :provider
  end
end
