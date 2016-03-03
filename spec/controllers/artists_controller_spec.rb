require "rails_helper"

RSpec.describe ArtistsController, type: :controller do
  let(:valid_attributes) { build(:artist).attributes }
  let(:valid_event_attributes) { build(:event).attributes }
  let(:invalid_attributes) { build(:artist, name: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArtistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all artists as @artists" do
      artist = Artist.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:artists)).to eq([artist])
    end
  end

  describe "GET #show" do
    it "assigns the requested artist as @artist" do
      artist = Artist.create! valid_attributes
      artist.events.create! valid_event_attributes
      get :show, { id: artist.to_param }, valid_session
      expect(assigns(:artist)).to eq(artist)
      expect(assigns(:upcoming_events)).to eq(artist.events)
    end
  end
end
