class Controller

  def initialize(plateau:)
    @plateau = plateau
  end

  def land(mars_rover, heading)
    plateau.current_rovers << mars_rover
    mars_rover.set_heading(heading)
  end

  def check_currently_landed_rovers
    plateau.current_rovers
  end

  def check_rover_position(mars_rover)
    mars_rover.print_current_position
  end

  def change_rover_position(mars_rover, position_change_input)
    position_change_array = split_input(position_change_input)
    position_changer(mars_rover, position_change_array)
    mars_rover.current_position
  end

  private

  attr_reader :plateau

  def split_input(input_to_split)
    input_to_split.split(//)
  end

  def position_changer(mars_rover, position_change_array)
    position_change_array.each do |direction_change|
      mars_rover.rotate_right if direction_change == "R"
    end
  end

end
