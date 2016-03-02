class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    client = Soundcloud.new(client_id: ENV["SOUNDCLOUD_CLIENT_ID"]) # ,
    # client_secret: ENV["SOUNDCLOUD_SECRET"])

    tracks = client.get("/tracks", q: @artist.name)

    # If we found some tracks, lets show a random one
    if tracks.present?
      track_url = tracks.sample.permalink_url
      @embed_info = client.get("/oembed", url: track_url)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end
end
