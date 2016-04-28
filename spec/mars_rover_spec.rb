require 'mars_rover'

describe MarsRover do

  subject (:mars_rover) { described_class.new(compass: compass) }

  # let (:start_position) { 'N' }
  let (:north) { 'N' }
  let (:east) { 'E' }
  let (:south) { 'S' }
  let (:west) { 'W' }
  # let (:position_after_right_turn) { 'E' }
  # let (:position_after_left_turn) { 'W' }

  let (:compass) { double(:compass, headings: possible_directions) }
  let (:possible_directions) { ['N', 'E', 'S', 'W']}

  describe 'compass' do

    it 'can understand compass directions' do
      expect(mars_rover.possible_compass_directions).to eq(possible_directions)
    end

  end

  describe 'position' do

    it 'can be returned' do
      mars_rover.set_heading(north)
      expect(mars_rover.print_current_position).to eq(north)
    end

    it 'can be set' do
      expect(mars_rover.set_heading(north)).to eq([north])
    end
  end

  describe 'turning' do

    it 'can be done to the right' do
      mars_rover.set_heading(north)
      expect(mars_rover.rotate_right).to eq([east])
    end

    it 'can turn right when facing west' do
      mars_rover.set_heading(west)
      expect(mars_rover.rotate_right).to eq([north])
    end

    it 'can be done to the left' do
      mars_rover.set_heading(north)
      expect(mars_rover.rotate_left).to eq([west])
    end
  end
end
