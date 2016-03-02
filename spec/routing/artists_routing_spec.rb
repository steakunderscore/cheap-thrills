require "rails_helper"

RSpec.describe ArtistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/artists").to route_to("artists#index")
    end

    it "routes to #show" do
      expect(get: "/artists/1").to route_to("artists#show", id: "1")
    end
  end
end
