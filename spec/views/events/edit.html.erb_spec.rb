require "rails_helper"

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              venue: nil,
                              price: 1,
                              soldout: false
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_venue_id[name=?]", "event[venue_id]"

      assert_select "input#event_price[name=?]", "event[price]"

      assert_select "input#event_soldout[name=?]", "event[soldout]"
    end
  end
end
