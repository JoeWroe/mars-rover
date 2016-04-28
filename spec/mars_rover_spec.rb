require 'mars_rover'

describe MarsRover do

  subject(:mars_rover) { described_class.new(compass: compass) }

  let(:start_position) { 'N' }

  let(:compass) { double(:compass, headings: possible_directions) }
  let(:possible_directions) { ['N', 'E', 'S', 'W']}

  describe 'position' do

    it 'can understand compass directions' do
      expect(mars_rover.possible_compass_directions).to eq(possible_directions)
    end

    it 'can have a current position' do
      expect(mars_rover.print_current_position).to eq(start_position)
    end
  end
end
