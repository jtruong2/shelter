require "rails_helper"

describe WeatherAlertService do
  context "class methods" do
    context ".find_national_alerts" do
      it "finds all national weather alerts" do
          raw_alerts = WeatherAlertService.find_national_alerts
          raw_alert = raw_alerts[10][:properties]
          # .first is a test message that is filtered
          # out by the Alert Poro

          expect(raw_alerts.count).to eq(25)

          expect(raw_alert).to have_key(:event)
          expect(raw_alert[:event]).to be_a String

          expect(raw_alert).to have_key(:headline)
          expect(raw_alert[:headline]).to be_a String

          expect(raw_alert).to have_key(:description)
          expect(raw_alert[:description]).to be_a String

          expect(raw_alert).to have_key(:instruction)
          expect(raw_alert[:instruction]).to be_a String

          expect(raw_alert).to have_key(:severity)
          expect(raw_alert[:severity]).to be_a String

          expect(raw_alert).to have_key(:urgency)
          expect(raw_alert[:urgency]).to be_a String
      end
    end
  end
end
