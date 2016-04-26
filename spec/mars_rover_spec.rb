require 'mars_rover'

describe MarsRover do

  subject(:mars_rover) { described_class.new(compass: compass) }

  let(:compass) { double(:compass, possible_directions: possible_directions) }
  let(:possible_directions) { ['N', 'E', 'S', 'W']}

  describe 'position' do

    it 'can access a compass' do
      expect(mars_rover.possible_compass_directions).to eq(possible_directions)
    end
  end
end
