require 'controller'

describe Controller do

  subject(:controller) { described_class.new(plateau: plateau) }

  let(:plateau) { double(:plateau, current_rovers: rovers_on_plateau) }
  let(:mars_rover) { double(:mars_rover) }

  let(:rovers_on_plateau) { [mars_rover] }

  describe 'landing a rover at a given position' do

    it 'can land a rover' do
      expect(controller.land(mars_rover)).to eq(rovers_on_plateau)
    end
  end

  describe 'managing the plateau' do

    it 'can find out what is currently on the plateau' do
      expect(controller.check_currently_landed_rovers).to eq(rovers_on_plateau)
    end
  end
end
