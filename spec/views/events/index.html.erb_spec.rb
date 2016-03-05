require "rails_helper"

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
             FactoryGirl.create(:event),
             FactoryGirl.create(:event, price: 2351)
           ])
  end

  it "renders a list of events" do
    render
    assert_select "tbody>tr", count: 2
  end

  it "renders the price nicely" do
    render
    expect(rendered).to match(/\$23.51/)
  end
end
