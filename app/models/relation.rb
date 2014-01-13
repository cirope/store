class Relation < ActiveRecord::Base
  include Auditable
  include Relations::Validation

  belongs_to :organization
  belongs_to :user
end
