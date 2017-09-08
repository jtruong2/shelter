class DirectionStep
  attr_reader :html_instructions, :approx_distance, :approx_duration

  def initialize(step_hash)
    @html_instructions = step_hash[:html_instructions]
    @approx_duration   = step_hash[:duration][:text]
    @approx_distance   = step_hash[:distance][:text]
  end
end
