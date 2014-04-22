class Service < ActiveRecord::Base
  include CommodityClassification

  def to_s
    name
  end
end
