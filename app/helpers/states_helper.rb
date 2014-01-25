module StatesHelper
  def states
    State.ordered
  end

  def states_and_cities
    State.ordered.includes :cities
  end
end
