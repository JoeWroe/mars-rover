require 'mars_rover'

describe MarsRover do

  subject(:mars_rover) { described_class.new(compass: compass) }

  let(:compass) { double(:compass, headings: possible_directions) }
  let(:possible_directions) { ['N', 'E', 'S', 'W']}

  describe 'position' do

    it 'can understand compass directions' do
      expect(mars_rover.possible_compass_directions).to eq(possible_directions)
    end
  end
end
