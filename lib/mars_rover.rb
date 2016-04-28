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
    current_position.join(" ")
  end

  def set_position(x_coord, y_coord, heading)
    if compass.headings.include? heading
      current_position[0] = x_coord
      current_position[1] = y_coord
      current_position[2] = heading
      current_position
    end
  end

  def rotate_right
    current_heading_compass_index = find_index_of_current_heading(current_position[2])
    new_heading_compass_index = add_one_to_index(current_heading_compass_index)
    new_heading = compass.headings[new_heading_compass_index]
    set_position(current_position[0], current_position[1], new_heading)
  end

  def rotate_left
    current_heading_compass_index = find_index_of_current_heading(current_position[2])
    new_heading_compass_index = subtract_one_from_index(current_heading_compass_index)
    new_heading = compass.headings[new_heading_compass_index]
    set_position(current_position[0], current_position[1], new_heading)
  end

  def move_forward
    add_one_to_y_axis if current_heading == "N"
    add_one_to_x_axis if current_heading == "E"
    take_one_from_y_axis if current_heading == "S"
    take_one_from_x_axis if current_heading == "W"
    current_position
  end

  private

  attr_reader :compass

  def current_heading
    current_position[2]
  end

  def find_index_of_current_heading(current_heading)
    compass.headings.index(current_heading)
  end

  def add_one_to_index(index)
    if index == compass.headings.length - 1
      0
    else
      index + 1
    end
  end

  def subtract_one_from_index(index)
    index - 1
  end

  def add_one_to_y_axis
    current_position[1] = current_position[1].to_i + 1
  end

  def add_one_to_x_axis
    current_position[0] = current_position[0].to_i + 1
  end

  def take_one_from_y_axis
    current_position[1] = current_position[1].to_i - 1
  end

  def take_one_from_x_axis
    current_position[0] = current_position[0].to_i - 1
  end

end
