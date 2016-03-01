require "rails_helper"

RSpec.describe "artists/new", type: :view do
  before(:each) do
    assign(:artist, Artist.new(
                      event: nil,
                      name: "MyString"
    ))
  end

  it "renders new artist form" do
    render

    assert_select "form[action=?][method=?]", artists_path, "post" do
      assert_select "input#artist_event_id[name=?]", "artist[event_id]"

      assert_select "input#artist_name[name=?]", "artist[name]"
    end
  end
end
