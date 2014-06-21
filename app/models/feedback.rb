class Feedback < ActiveRecord::Base
  SCORES = %w(great good poor)

  include Accounts::Scoped
  include Auditable
  include Feedbacks::Token
  include Feedbacks::Scopes
  include Feedbacks::Steps
  include Feedbacks::Validation

  delegate :name, :email, to: :customer, prefix: true

  belongs_to :owner, polymorphic: true
  belongs_to :customer

  def to_param
    token
  end
end
