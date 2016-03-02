require "rails_helper"

RSpec.describe Event, type: :model do
  let(:event_tomorrow) { create(:event, starts_at: Time.now + 1.day) }
  let(:event_next_week) { create(:event, starts_at: Time.now + 7.days) }

  it { should belong_to(:venue) }
  it { should have_many(:artist_events) }
  it { should have_many(:artists).through(:artist_events) }

  it "returns events sorted alphanumerically by name" do
    expect(Event.all).to eq [event_tomorrow, event_next_week]
  end

  describe "attribute validations" do
    pending
  end
end
