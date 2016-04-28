require 'plateau'

describe Plateau do

  subject (:plateau) { described_class.new }

  let (:empty_array) { [] }

  describe 'contains' do

    it 'no rovers at initialization' do
      expect(plateau.current_rovers).to eq(empty_array)
    end
  end
end
