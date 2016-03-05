require "rails_helper"

RSpec.describe Event, type: :model do
  let(:event_tomorrow) { create(:event, starts_at: Time.zone.now + 1.day) }
  let(:event_next_week) { create(:event, starts_at: Time.zone.now + 7.days) }

  it { should belong_to(:venue) }
  it { should have_many(:artist_events) }
  it { should have_many(:artists).through(:artist_events) }

  it "returns events sorted alphanumerically by name" do
    expect(Event.all).to eq [event_tomorrow, event_next_week]
  end

  describe "attribute validations" do
    it { should validate_presence_of(:starts_at) }
    it { should validate_presence_of(:venue) }
    it { should validate_inclusion_of(:soldout).in_array([true, false]) }
  end

  describe "save price from string" do
    let(:price) { "$33.33" }
    let(:pricd_event) { build(:event, price: price) }

    it "should store the number as an int" do
      expect(pricd_event[:price_cent]).to eq(3333)
    end
    it "should return formatted string price" do
      expect(pricd_event.price).to eq(33.33)
    end
  end
end
