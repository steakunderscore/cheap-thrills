require "rails_helper"

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
                     venue: nil,
                     price: 1,
                     soldout: false
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_venue_id[name=?]", "event[venue_id]"

      assert_select "input#event_price[name=?]", "event[price]"

      assert_select "input#event_soldout[name=?]", "event[soldout]"
    end
  end
end
