require "rails_helper"

RSpec.describe "venues/show", type: :view do
  before(:each) do
    @venue = assign(:venue, Venue.create!(
                              name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
