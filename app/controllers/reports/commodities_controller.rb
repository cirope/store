class Reports::CommoditiesController < ApplicationController
  respond_to :html

  before_action :authorize
  before_action :set_title

  def index
    @start  = parse_date_param(:start)  || Time.zone.today.at_beginning_of_month
    @finish = parse_date_param(:finish) || Time.zone.today

    @commodities_sales = Commodity.with_receipts_between(@start, @finish).receipt_sales

    respond_with @commodities_sales
  end

  private

    def parse_date_param name
      Timeliness.parse params[name], :date, zone: :current
    end
end
