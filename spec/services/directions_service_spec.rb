require "rails_helper"

describe DirectionService do
  context "class methods" do
    context ".find_directions" do
      it "finds all national weather alerts" do
        VCR.use_cassette("services/find_directions") do
          location       = "2001+Blake+St+Denver+CO"
          destination    = "1331+17th+St+Denver+CO"
          raw_directions = DirectionService.find_directions(location, destination)

          expect(raw_directions).to have_key(:steps)
          expect(raw_directions[:steps]).to be_a Array

          expect(raw_directions).to have_key(:duration)
          expect(raw_directions[:duration]).to be_a Hash

          expect(raw_directions[:duration]).to have_key(:text)
          expect(raw_directions[:duration][:text]).to be_a String

          expect(raw_directions).to have_key(:distance)
          expect(raw_directions[:distance]).to be_a Hash

          expect(raw_directions[:distance]).to have_key(:text)
          expect(raw_directions[:distance][:text]).to be_a String

          expect(raw_directions).to have_key(:start_address)
          expect(raw_directions[:start_address]).to be_a String

          expect(raw_directions).to have_key(:end_address)
          expect(raw_directions[:end_address]).to be_a String
        end
      end
    end
  end
end
