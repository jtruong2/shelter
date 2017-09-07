require "rails_helper"

describe Direction do
  it "successfuly initializes with valid attrs" do

    steps = [
             {:distance=>{text: "0.1 mi"},
              :duration=>{text: "1 min"},
              :html_instructions=>
               "Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>"},
             {:distance=>{text: "0.5 mi"},
              :duration=>{text: "4 mins"},
              :html_instructions=>"Turn <b>left</b> onto <b>Lawrence St</b>"
              }
            ]

    valid_attrs = {
      steps: steps,
      :duration=>{text: "10 years"},
      :distance=>{text: "4 miles"},
      start_address: "1331+17th+St+Denver+CO",
      end_address: "2001+Blake+St+Denver+CO"
    }

    direction = Direction.new(valid_attrs)

    expect(direction.steps).to be_a(Array)
    expect(direction.steps.first.html_instructions).to eq("Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>")
    expect(direction.duration).to eq("10 years")
    expect(direction.distance).to eq("4 miles")
    expect(direction.start_address).to eq("1331+17th+St+Denver+CO")
    expect(direction.end_address).to eq("2001+Blake+St+Denver+CO")
  end
end
