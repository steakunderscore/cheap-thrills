require "rails_helper"

RSpec.describe "application/upcoming_events partial", type: :view do
  describe "with no upcoming events" do
    it "should display message about no events for this artist" do
      render partial: "application/upcoming_events",
             locals: { upcoming_events: [] }
      expect(response).to include("Sorry there are no upcoming events")
    end
  end

  describe "with upcoming events" do
    let(:upcoming_events) do
      [
        FactoryGirl.build(:event),
        FactoryGirl.build(:event)
      ]
    end

    it "should display the events listed" do
      render partial: "application/upcoming_events",
             locals: { upcoming_events: upcoming_events }
      assert_select "tr>td", count: 2
    end
  end
end
