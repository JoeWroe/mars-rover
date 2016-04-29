class Camera

  attr_reader :mars_rover, :recording

  def initialize(mars_rover:)
    @mars_rover = mars_rover
    @recording = false
  end

  def toggle_recording
    @recording = !@recording
  end
end
