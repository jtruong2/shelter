require "rails_helper"

describe DirectionStep do
  it "successfuly initializes with valid attrs" do
    valid_attrs = {
      html_instructions: "Just Walk",
      duration: {text: "1 million years"},
      distance: {text: "1 million miles"}
    }

    direction_step = DirectionStep.new(valid_attrs)

    expect(direction_step.html_instructions).to eq("Just Walk")
    expect(direction_step.approx_duration).to eq("1 million years")
    expect(direction_step.approx_distance).to eq("1 million miles")
  end
end
