class Tagging < ActiveRecord::Base
  validates :tag_id, presence: true,
    uniqueness: { scope: [:taggable_id, :taggable_type] }

  belongs_to :tag
  belongs_to :taggable, polymorphic: true
end
