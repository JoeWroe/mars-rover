require 'mars_rover'

describe MarsRover do

  subject (:mars_rover) { described_class.new(compass: compass) }

  let (:north) { 'N' }
  let (:east) { 'E' }
  let (:south) { 'S' }
  let (:west) { 'W' }
  let (:start_position) { [1, 2, 'N'] }
  let (:start_position_printed) { '1 2 N' }

  let (:compass) { double(:compass, headings: possible_directions) }
  let (:possible_directions) { ['N', 'E', 'S', 'W']}

  describe 'compass' do

    it 'can understand compass directions' do
      expect(mars_rover.possible_compass_directions).to eq(possible_directions)
    end

  end

  describe 'position' do

    it 'can be returned' do
      mars_rover.set_position(1, 2, north)
      expect(mars_rover.print_current_position).to eq(start_position_printed)
    end

    it 'can be set' do
      expect(mars_rover.set_position(1, 2, north)).to eq(start_position)
    end
  end

  describe 'turning' do

    it 'can be done to the right' do
      mars_rover.set_position(1, 2, north)
      expect(mars_rover.rotate_right).to eq([1, 2, east])
    end

    it 'can turn right when facing west' do
      mars_rover.set_position(1, 2, west)
      expect(mars_rover.rotate_right).to eq([1, 2, north])
    end

    it 'can be done to the left' do
      mars_rover.set_position(1, 2, north)
      expect(mars_rover.rotate_left).to eq([1, 2, west])
    end
  end
end
