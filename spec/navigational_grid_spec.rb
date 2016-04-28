require 'navigational_grid'

describe NavigationalGrid do

  subject (:navigational_grid) { described_class.new(plateau: plateau, x_coord: x_coord, y_coord: y_coord) }

  let (:plateau) { double(:plateau) }
  let (:x_coord) { 5 }
  let (:y_coord) { 5 }

  let (:grid_size) { { x_coord: 5, y_coord: 5 } }

  it 'can have a grid of a given size' do
    expect(navigational_grid.size).to eq(grid_size)
  end
end
