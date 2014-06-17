class Item < ActiveRecord::Base
  include CommodityClassification
  include Items::Scopes
  include Items::Validation

  def to_s
    name
  end
end
