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

  private

  attr_reader :plateau

end
