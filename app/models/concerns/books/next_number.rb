module Books::NextNumber
  extend ActiveSupport::Concern

  def next_available_number
    last_used_number.next
  end

  def next_number
    increment! :last_used_number

    last_used_number
  end
end
