require_relative 'navigational_grid'

class Controller

  def initialize(plateau:)
    @plateau = plateau
  end

  def add_navigational_grid(x_coord, y_coord)
    navigational_grid = navigational_grid_setter(x_coord, y_coord)
    navigational_grid.size
  end

  def land(mars_rover, position)
    plateau.current_rovers << mars_rover
    land_position_array = split_input(position)
    mars_rover.set_position(land_position_array[0], land_position_array[2], land_position_array[4])
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
    check_rover_position(mars_rover)
  end

  private

  attr_reader :plateau

  def navigational_grid_setter(x_coord, y_coord)
    NavigationalGrid.new(plateau: plateau, x_coord: x_coord, y_coord: y_coord)
  end

  def split_input(input_to_split)
    input_to_split.split(//)
  end

  def position_changer(mars_rover, position_change_array)
    position_change_array.each do |direction_change|
      mars_rover.rotate_right if direction_change == "R"
      mars_rover.rotate_left if direction_change == "L"
      mars_rover.move_forward if direction_change == "M"
    end
  end

end
