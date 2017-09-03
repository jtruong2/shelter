require "rails_helper"

describe Alert do
  it "successfuly initializes with valid attrs" do
    valid_attrs = {
      event: "Big Event",
      headline: "Crazy Weather Emergency Coming Your Way",
      description: "lots of rain, thunder and lighting.",
      instructions: "Stay inside",
      severity: "Moderate",
      urgency: "kinda urgent"
    }

    alert = Alert.new(valid_attrs)

    expect(alert.event).to eq("Big Event")
    expect(alert.headline).to eq("Crazy Weather Emergency Coming Your Way")
    expect(alert.description).to eq("lots of rain, thunder and lighting.")
    expect(alert.instructions).to eq("Stay inside")
    expect(alert.severity).to eq("Moderate")
    expect(alert.urgency).to eq("kinda urgent")
  end
end
