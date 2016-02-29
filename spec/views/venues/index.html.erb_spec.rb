require "rails_helper"

RSpec.describe "venues/index", type: :view do
  before(:each) do
    assign(:venues, [
             Venue.create!(
               name: "Name"
             ),
             Venue.create!(
               name: "Name"
             )
           ])
  end

  it "renders a list of venues" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
