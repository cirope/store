class Reports::CommoditiesController < ApplicationController
  include Reports::DateRange

  respond_to :html

  before_action :authorize
  before_action :set_title
  before_action :set_date_range

  def index
    @commodities_sales = Commodity.sales_report_by params[:voucher], start: @start, finish: @finish

    respond_with @commodities_sales
  end
end
