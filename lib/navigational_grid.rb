class NavigationalGrid

  def initialize(plateau:, x_coord:, y_coord:)
    @plateau = plateau
    @x_coord = x_coord
    @y_coord = y_coord
  end

  def size
    { x_coord: x_coord, y_coord: y_coord }
  end

  private

  attr_reader :plateau, :x_coord, :y_coord
end
