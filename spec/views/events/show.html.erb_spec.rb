require "rails_helper"

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, FactoryGirl.create(:event, price_cent: 1000,
                                                       soldout: false))
    @venue = assign(:venue, @event.venue)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/\$10.00/)
    expect(rendered).to match(/Not yet/)
  end
end
