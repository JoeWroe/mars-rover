require 'controller'

describe Controller do

  subject (:controller) { described_class.new(plateau: plateau) }

  let (:plateau) { double(:plateau, current_rovers: rovers_on_plateau) }
  let (:mars_rover) {
                      double(:mars_rover,
                      current_position: mars_rover_position,
                      print_current_position: mars_rover_position_printed,
                      set_position: mars_rover_position,
                      rotate_right: mars_rover_position_after_right_turn,
                      rotate_left: mars_rover_position_after_left_turn,
                      move_forward: mars_rover_position_after_move_forward)
                    }
  let (:navigational_grid) { double(:navigational_grid, size: navigational_grid_size) }

  let (:rovers_on_plateau) { [mars_rover] }
  let (:mars_rover_position) { [1, 2, 'N'] }
  let (:mars_rover_position_printed) { '1 2 N' }
  let (:mars_rover_position_after_right_turn) { ['E'] }
  let (:navigational_grid_size) { { :x_coord=>5, :y_coord=>5 } }
  let (:mars_rover_position_after_left_turn) { ['W'] }
  let (:mars_rover_position_after_move_forward) { }

  describe 'landing a rover at a given position' do

    it 'can land a rover with a given heading' do
      expect(controller.land(mars_rover, '1 2 N')).to eq(mars_rover.current_position)
    end

    it 'can check a rovers position' do
      expect(controller.check_rover_position(mars_rover)).to eq(mars_rover_position_printed)
    end
  end

  describe 'position of a rover after right turn' do

    let (:mars_rover_position) { ['E'] }

    it 'can be changed with a right turn' do
      expect(controller.change_rover_position(mars_rover, "R")).to eq(mars_rover_position_after_right_turn)
    end
  end

  describe 'position of a rover after a left turn' do

    let (:mars_rover_position) { ['W'] }

    it 'can be changed with a left turn' do
      expect(controller.change_rover_position(mars_rover, "L")).to eq(mars_rover_position_after_left_turn)
    end
  end

  describe 'positon of a rover after a move forward' do

    describe 'north' do

      let (:mars_rover_position) { mars_rover_position_after_move_forward }
      let (:mars_rover_position_after_move_forward) { [1, 3, 'N'] }

      it 'adds one to y_coord' do
        expect(controller.change_rover_position(mars_rover, "M")).to eq(mars_rover_position_after_move_forward)
      end
    end

    describe 'east' do

      let (:mars_rover_position) { mars_rover_position_after_move_forward }
      let (:mars_rover_position_after_move_forward) { [2, 2, 'E'] }

      it 'adds one to x_coord' do
        expect(controller.change_rover_position(mars_rover, "M")).to eq(mars_rover_position_after_move_forward)
      end
    end

    describe 'south' do

      let (:mars_rover_position) { mars_rover_position_after_move_forward }
      let (:mars_rover_position_after_move_forward) { [1, 1, 'S'] }

      it 'takes one to y_coord' do
        expect(controller.change_rover_position(mars_rover, "M")).to eq(mars_rover_position_after_move_forward)
      end
    end

    describe 'west' do

      let (:mars_rover_position) { mars_rover_position_after_move_forward }
      let (:mars_rover_position_after_move_forward) { [0, 2, 'W'] }

      it 'takes one to x_coord' do
        expect(controller.change_rover_position(mars_rover, "M")).to eq(mars_rover_position_after_move_forward)
      end
    end
  end

  describe 'managing the plateau' do

    it 'can find out what is currently there' do
      expect(controller.check_currently_landed_rovers).to eq(rovers_on_plateau)
    end

    it 'can add a navigational grid' do
      expect(controller.add_navigational_grid(5, 5)).to eq(navigational_grid_size)
    end
  end
end
