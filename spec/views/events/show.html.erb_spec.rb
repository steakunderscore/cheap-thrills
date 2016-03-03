require "rails_helper"

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, FactoryGirl.create(:event, price: 1000, soldout:
                                               false))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/\$10.0/)
    expect(rendered).to match(/Not yet/)
  end
end
