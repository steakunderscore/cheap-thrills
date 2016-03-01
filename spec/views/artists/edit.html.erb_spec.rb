require "rails_helper"

RSpec.describe "artists/edit", type: :view do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
                                event: nil,
                                name: "MyString"
    ))
  end

  it "renders the edit artist form" do
    render

    assert_select "form[action=?][method=?]", artist_path(@artist), "post" do
      assert_select "input#artist_event_id[name=?]", "artist[event_id]"

      assert_select "input#artist_name[name=?]", "artist[name]"
    end
  end
end
