module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings
  end

  def tag_list
    tags.pluck('name').join(', ')
  end

  def tag_list= names
    self.tags = names.split(',').map do |name|
      Tag.by_name(name).first_or_create!(name: name)
    end
  end
end
