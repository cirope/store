class Reports::FeedbacksController < ApplicationController
  include Reports::DateRange

  respond_to :html

  before_action :authorize
  before_action :set_title
  before_action :set_date_range

  def index
    @start  ||= Time.zone.today.at_beginning_of_month
    @finish ||= Time.zone.today
    @feedback_stats = Feedback.stats start: @start, finish: @finish

    respond_with @feedback_stats
  end
end
