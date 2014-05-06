class Service < ActiveRecord::Base
  include CommodityClassification
  include Services::Validation

  def to_s
    name
  end
end
