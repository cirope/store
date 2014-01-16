module CustomersHelper
  def states
    State.includes :cities
  end
end
