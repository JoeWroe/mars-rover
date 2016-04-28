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
      current_position[0] = heading
      current_position
    end
  end

  def rotate_right
    current_heading_index = find_index_of_current_heading(current_heading)
    new_heading_index = add_one_to_index(current_heading_index)
    new_heading = compass.headings[new_heading_index]
    set_heading(new_heading)
  end

  def rotate_left
    current_heading_index = find_index_of_current_heading(current_heading)
    new_heading_index = subtract_one_from_index(current_heading_index)
    new_heading = compass.headings[new_heading_index]
    set_heading(new_heading)
  end

  private

  attr_reader :compass

  def current_heading
    current_position[0]
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

end
