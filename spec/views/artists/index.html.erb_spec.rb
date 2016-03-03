require "rails_helper"

RSpec.describe "artists/index", type: :view do
  before(:each) do
    assign(:artists, [
             FactoryGirl.create(:artist, name: "Name A"),
             FactoryGirl.create(:artist, name: "Name B")
           ])
  end

  it "renders a list of artists" do
    render
    assert_select "tr>td", /^Name (A|B)/, count: 2
  end
end
