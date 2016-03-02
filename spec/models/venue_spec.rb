require "rails_helper"

RSpec.describe Venue, type: :model do
  let(:venue_with_c_name) { create(:venue, name: "c starting name") }
  let(:venue_with_b_name) { create(:venue, name: "b starting name") }

  it "returns venues sorted alphanumerically by name" do
    expect(Venue.all).to eq [venue_with_b_name, venue_with_c_name]
  end

  describe "attribute validations" do
    it { should validate_presence_of(:name) }
  end
end
