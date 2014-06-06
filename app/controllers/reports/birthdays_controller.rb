class Reports::BirthdaysController < ApplicationController
  include Reports::DateRange

  respond_to :html

  before_action :authorize
  before_action :set_title
  before_action :set_date_range

  def index
    @customers = Customer.order_by_birth.find_births_for @start, @finish

    respond_with @customers
  end
end
