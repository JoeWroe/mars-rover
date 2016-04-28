require 'controller'

describe Controller do

  subject (:controller) { described_class.new(plateau: plateau) }

  let (:plateau) { double(:plateau, current_rovers: rovers_on_plateau) }
  let (:mars_rover) {
                      double(:mars_rover,
                      current_position: mars_rover_position,
                      print_current_position: mars_rover_position_printed,
                      set_heading: mars_rover_position)
                    }

  let (:rovers_on_plateau) { [mars_rover] }
  let (:mars_rover_position) { ['N'] }
  let (:mars_rover_position_printed) { 'N' }

  describe 'landing a rover at a given position' do

    it 'can land a rover with a given heading' do
      expect(controller.land(mars_rover, 'N')).to eq(mars_rover.current_position)
    end

    it 'can check a rovers position' do
      expect(controller.check_rover_position(mars_rover)).to eq(mars_rover_position_printed)
    end
  end

  describe 'managing the plateau' do

    it 'can find out what is currently on the plateau' do
      expect(controller.check_currently_landed_rovers).to eq(rovers_on_plateau)
    end
  end
end
