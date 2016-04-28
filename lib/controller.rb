class Controller

  def initialize(plateau:)
    @plateau = plateau
  end

  def land(mars_rover)
    plateau.current_rovers << mars_rover
  end

  def check_currently_landed_rovers
    plateau.current_rovers
  end

  def check_rover_position(mars_rover)
    mars_rover.print_current_position
  end

  private

  attr_reader :plateau

end
