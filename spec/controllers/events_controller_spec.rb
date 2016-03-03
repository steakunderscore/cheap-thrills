require "rails_helper"

RSpec.describe EventsController, type: :controller do
  let(:valid_attributes) { FactoryGirl.build(:event).attributes }
  let(:invalid_attributes) do
    FactoryGirl.build(:event, starts_at: nil).attributes
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all events as @events" do
      event = Event.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET #show" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, { id: event.to_param }, valid_session
      expect(assigns(:event)).to eq(event)
    end
  end
end
