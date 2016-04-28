require 'mars_rover'

describe MarsRover do

  subject (:mars_rover) { described_class.new(compass: compass) }

  let (:start_position) { 'N' }
  let (:position_after_right_turn) { 'E' }

  let (:compass) { double(:compass, headings: possible_directions) }
  let (:possible_directions) { ['N', 'E', 'S', 'W']}

  describe 'compass' do

    it 'can understand compass directions' do
      expect(mars_rover.possible_compass_directions).to eq(possible_directions)
    end

  end

  describe 'position' do

    it 'can be returned' do
      mars_rover.set_heading(start_position)
      expect(mars_rover.print_current_position).to eq(start_position)
    end

    it 'can be set' do
      expect(mars_rover.set_heading(start_position)).to eq([start_position])
    end
  end

  describe 'turning' do

    it 'can be done to the right' do
      mars_rover.set_heading(start_position)
      expect(mars_rover.rotate_right).to eq([position_after_right_turn])
    end
  end
end
