require "rails_helper"

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do
  describe "generate event title" do
    it "concats the artist name with the venue name" do
      venue_name = "The Venue Name"
      artist_name = "The artist 1"
      venue = FactoryGirl.create(:venue, name: venue_name)
      event = FactoryGirl.build(:event, venue: venue)
      artist = FactoryGirl.build(:artist, name: artist_name)
      event.artists << artist

      expect(helper.event_title(event)).
        to eq("The artist 1 playing at The Venue Name")
    end

    it "concats the multiple artist names  with the venue name" do
      venue_name = "The Venue Name"
      artist_name_1 = "The artist 1"
      artist_name_2 = "The artist 2"
      venue = FactoryGirl.create(:venue, name: venue_name)
      event = FactoryGirl.build(:event, venue: venue)
      artist1 = FactoryGirl.build(:artist, name: artist_name_1)
      artist2 = FactoryGirl.build(:artist, name: artist_name_2)
      event.artists = [artist1, artist2]

      expect(helper.event_title(event)).
        to eq("The artist 1 + The artist 2 playing at The Venue Name")
    end
  end
end
