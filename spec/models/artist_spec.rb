require "rails_helper"

RSpec.describe Artist, type: :model do
  it { should have_many(:artist_events) }
  it { should have_many(:events).through(:artist_events) }

  let(:artist_with_c_name) { create(:artist, name: "c starting name") }
  let(:artist_with_b_name) { create(:artist, name: "b starting name") }

  it "returns artists sorted alphanumerically by name" do
    expect(Artist.all).to eq [artist_with_b_name, artist_with_c_name]
  end

  describe "attribute validations" do
    it { should validate_presence_of(:name) }
  end
end
