require 'controller'

describe Controller do

  subject (:controller) { described_class.new(plateau: plateau) }

  let (:plateau) { double(:plateau, current_rovers: rovers_on_plateau) }
  let (:mars_rover) { double(:mars_rover, print_current_position: mars_rover_start_position) }

  let (:rovers_on_plateau) { [mars_rover] }
  let (:mars_rover_start_position) { 'N' }

  describe 'landing a rover at a given position' do

    it 'can land a rover' do
      expect(controller.land(mars_rover)).to eq(rovers_on_plateau)
    end

    it 'can check a rovers position' do
      expect(controller.check_rover_position(mars_rover)).to eq(mars_rover_start_position)
    end
  end

  describe 'managing the plateau' do

    it 'can find out what is currently on the plateau' do
      expect(controller.check_currently_landed_rovers).to eq(rovers_on_plateau)
    end
  end
end
