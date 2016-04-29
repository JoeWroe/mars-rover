require 'camera'

describe Camera do

  subject(:camera) { described_class.new(mars_rover: mars_rover) }

  let (:mars_rover) { double(:mars_rover)}

  it 'is assosiated with a mars rover' do
    expect(camera.mars_rover).to eq(mars_rover)
  end

  it 'has a recording feature' do
    expect(camera.recording).to eq(false)
  end
end
