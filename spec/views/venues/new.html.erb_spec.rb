require "rails_helper"

RSpec.describe "venues/new", type: :view do
  before(:each) do
    assign(:venue, Venue.new(
                     name: "MyString"
    ))
  end

  it "renders new venue form" do
    render

    assert_select "form[action=?][method=?]", venues_path, "post" do
      assert_select "input#venue_name[name=?]", "venue[name]"
    end
  end
end
