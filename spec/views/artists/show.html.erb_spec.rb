require "rails_helper"

RSpec.describe "artists/show", type: :view do
  before(:each) do
    @artist = FactoryGirl.create(:artist, name: "Name")
    march6at10pm = Time.new(4016, 03, 06, 22, 43, 00, "-05:00")
    @artist.events << FactoryGirl.create(:event,
                                         starts_at: march6at10pm)

    assign(:artist, @artist)
    assign(:upcoming_events, @artist.events.upcoming)
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

  it "renders the time in localtime" do
    render
    expect(response).to match(/March 06, 4016 22:43/)
  end
end
