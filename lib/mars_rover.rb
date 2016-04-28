class MarsRover

  attr_reader :current_position

  def initialize(compass:)
    @compass = compass
    @current_position = []
  end

  def possible_compass_directions
    compass.headings
  end

  def print_current_position
    current_position.join(", ")
  end

  def set_heading(heading)
    if compass.headings.include? heading
      current_position << heading
    end
  end

  private

  attr_reader :compass

end
