class MarsRover

  def initialize(compass:)
    @compass = compass
  end

  def possible_compass_directions
    compass.headings
  end

  private

  attr_reader :compass

end
