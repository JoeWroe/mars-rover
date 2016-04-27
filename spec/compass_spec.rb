require 'compass'

describe Compass do

  subject(:compass) { described_class.new(headings) }

  let(:headings) { ['N', 'E', 'S', 'W']}

  it 'has a list of possible headings' do
    expect(compass.headings).to eq(headings)
  end
end
