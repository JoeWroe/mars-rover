class MarsRover

  attr_reader :current_position

  def initialize(compass:)
    @compass = compass
    @current_position = current_position
  end

  def possible_compass_directions
    compass.headings
  end

  def current_position
    []
  end

  def print_current_position
    current_position.join(", ")
  end

  # def set_heading(heading)
  #   compass.headings.each do |headings|
  #     if heading == headings
  #       heading << current_position
  #     end
  #   end
  # end

  private

  attr_reader :compass

end
