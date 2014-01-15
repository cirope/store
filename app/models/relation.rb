class Relation < ActiveRecord::Base
  include Auditable
  include Relations::Validation

  belongs_to :account
  belongs_to :user
end
