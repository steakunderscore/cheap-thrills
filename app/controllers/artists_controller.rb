class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]
  before_action :set_upcoming_events, only: [:show]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    client = Soundcloud.new(client_id: ENV["SOUNDCLOUD_CLIENT_ID"])

    set_sample_track(client)

    # If we found some tracks, lets show a one
    if @artist.sample_track.present?
      @embed_info = client.get("/oembed", url: @artist.sample_track["permalink_url"])
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def set_upcoming_events
    @upcoming_events = @artist.events.upcoming
  end

  def set_sample_track(client)
    # Cache the track for next time
    @artist.sample_track ||= client.get("/tracks", q: @artist.name).first
    @artist.save!
  end
end
