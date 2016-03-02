require "rails_helper"

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              venue: nil,
                              price: 1,
                              soldout: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end
