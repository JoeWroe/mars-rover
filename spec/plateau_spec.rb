require 'plateau'

describe Plateau do

  subject (:plateau) { described_class.new } 

  let (:empty_array) { [] }

  describe 'the rovers it contains' do

    it 'empty at initialization' do
      expect(plateau.current_rovers).to eq(empty_array)
    end
  end
end
