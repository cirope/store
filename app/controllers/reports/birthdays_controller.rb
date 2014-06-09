class Reports::BirthdaysController < ApplicationController
  include Reports::DateRange

  respond_to :html

  before_action :authorize
  before_action :set_title
  before_action :set_date_range

  def index
    @start  ||= Time.zone.today
    @finish ||= 1.week.from_now.to_date
    @customers = Customer.order_by_birth.find_births_for @start, @finish

    respond_with @customers
  end
end
