describe 'User Stories' do

  let (:controller) { Controller.new(plateau: plateau) }
  let (:mars_rover) { MarsRover.new(compass: compass) }

  let (:plateau) { Plateau.new }
  let (:compass) { Compass.new(headings) }

  let (:headings) { ['N', 'E', 'S', 'W'] }
  let (:navigational_grid_size) { { :x_coord=>5, :y_coord=>5 } }

  # USER STORY 1
  # As a NASA controller,
  # So that NASA can explore Mars,
  # I'd like to interact with an online Mars Rover.
  it 'A NASA controller can interact with a Mars Rover' do
    expect(controller.land(mars_rover, 'N')).to_not eq(mars_rover)
  end

  # USER STORY 2
  # As a NASA controller,
  # So that I can explore a particular part of Mars,
  # I'd like to be able to land a Mars Rover on the plateau.
  it 'A NASA controller can land a mars rover on a plateau' do
    controller.land(mars_rover, 'N')
    expect(controller.check_currently_landed_rovers).to eq([mars_rover])
  end

  # USER STORY 3
  # As a NASA controller,
  # So that I can get a complete view of the surrounding terrain to send back to Earth,
  # I'd like to be able to start and stop our camera from recording.

  # USER STORY 4
  # As a NASA controller,
  # So that I know the position and location of a rover,
  # I'd like to be able to check a rovers current position and location.

  # USER STORY 5
  # As a NASA controller,
  # So that I can simplify navigation,
  # I'd like to be able to divide the plateau into a grid.
  it 'A NASA controller can add a navigational grid to the plateau' do
    expect(controller.add_navigational_grid(5, 5)).to eq(navigational_grid_size)
  end

  # USER STORY 6
  # As a NASA controller,
  # So that I can change a rovers heading,
  # I'd like to be able to spin a rover 90 degrees left and right.
  it 'A NASA controller can change the heading of a mars rover' do
    controller.land(mars_rover, 'N')
    expect(controller.check_rover_position(mars_rover)).to include "N"
    controller.change_rover_position(mars_rover, 'R')
    expect(controller.check_rover_position(mars_rover)).to include "E"
    controller.change_rover_position(mars_rover, 'LL')
    expect(controller.check_rover_position(mars_rover)).to include "W"
    controller.change_rover_position(mars_rover, 'L')
    expect(controller.check_rover_position(mars_rover)).to include "S"
    controller.change_rover_position(mars_rover, 'RR')
    expect(controller.check_rover_position(mars_rover)).to include "N"
  end

  # USER STORY 7
  # As a NASA controller,
  # So that I can advance on the grid,
  # I'd like to be able to move the rover forward one grid point.

end
