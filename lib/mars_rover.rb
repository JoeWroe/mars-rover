class MarsRover

  def initialize(compass:)
    @compass = compass
  end

  def possible_compass_directions
    compass.possible_directions
  end

  private

  attr_reader :compass

end
