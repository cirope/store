module Books::NextNumber
  extend ActiveSupport::Concern

  def next_available_number
    last_used_number.next
  end

  def next_number
    with_lock do
      increment! :last_used_number

      @_last_requested_number = last_used_number
    end
  end

  def return_number
    with_lock do
      if @_last_requested_number == reload.last_used_number
        decrement! :last_used_number
      else
        lock! false
        raise RuntimeError, 'Unretornable book number'
      end
    end
  end
end
