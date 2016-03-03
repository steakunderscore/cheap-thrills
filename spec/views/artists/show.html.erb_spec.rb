require "rails_helper"

RSpec.describe "artists/show", type: :view do
  before(:each) do
    @artist = assign(:artist, FactoryGirl.create(:artist, name: "Name"))
  end

  it "renders artist name in <h1>" do
    render
    assert_select "h1", text: "Name", count: 1
  end

  it "renders the upcoming partial" do
    render
    expect(response).to render_template(partial:
                                        "application/_upcoming_events")
  end
end
