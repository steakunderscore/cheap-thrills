require "rails_helper"

RSpec.describe VenuesController, type: :controller do
  let(:valid_attributes) { build(:venue).attributes }
  let(:valid_event_attributes) { build(:event).attributes }
  let(:invalid_attributes) { build(:venue, name: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VenuesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all venues as @venues" do
      venue = Venue.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:venues)).to eq([venue])
    end
  end

  describe "GET #show" do
    it "assigns the requested venue as @venue" do
      venue = Venue.create! valid_attributes
      venue.events.create! valid_event_attributes
      get :show, { id: venue.to_param }, valid_session
      expect(assigns(:venue)).to eq(venue)
      expect(assigns(:upcoming_events)).to eq(venue.events)
    end
  end
end
