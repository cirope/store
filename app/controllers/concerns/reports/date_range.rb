module Reports::DateRange
  extend ActiveSupport::Concern

  private

    def set_date_range
      @start  = parse_date_param(:start)  || Time.zone.today.at_beginning_of_month
      @finish = parse_date_param(:finish) || Time.zone.today
    end

    def parse_date_param name
      Timeliness.parse params[name], :date, zone: :current
    end
end
