require "rails_helper"

RSpec.describe ArtistsHelper, type: :helper do
  describe "generate when and where string" do
    it "concats the start time with the venue name" do
      start_time = Time.new(2016, 03, 02, 2, 30, 00, "+00:00") # 9:30pm EST
      venue_name = "The Venue Name"
      venue = FactoryGirl.create(:venue, name: venue_name)
      event = FactoryGirl.build(:event, venue: venue, starts_at: start_time)

      expect(helper.when_and_where(event)).
        to eq("March 01, 2016 21:30 at The Venue Name")
    end
  end
end
