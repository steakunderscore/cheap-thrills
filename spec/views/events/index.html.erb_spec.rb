require "rails_helper"

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
             Event.create!(
               venue: nil,
               price: 1,
               soldout: false
             ),
             Event.create!(
               venue: nil,
               price: 1,
               soldout: false
             )
           ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 1.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
