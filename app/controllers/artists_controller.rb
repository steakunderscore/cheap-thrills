require "google/apis/youtube_v3"

class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :youtube]
  before_action :set_upcoming_events, only: [:show]

  YT = ::Google::Apis::YoutubeV3

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    youtube
    soundcloud
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id] || params[:artist_id])
  end

  def set_upcoming_events
    @upcoming_events = @artist.events.upcoming
  end

  def set_sample_track(client)
    # Cache the track for next time
    @artist.sample_track ||= client.get("/tracks", q: @artist.name).first
    @artist.save!
  end

  def youtube
    client = YT::YouTubeService.new
    client.key = ENV["GOOGLE_DEVELOPER_KEY"]

    begin
      search_result = client.list_searches("id", q: @artist.name,
                                                 max_results: 1, type: "video")
      @video_id = search_result.items.first.id.video_id
    rescue => e
      logger.error "Looks like youtube is broken"
      logger.error e
    end
  end

  def soundcloud
    client = Soundcloud.new(client_id: ENV["SOUNDCLOUD_CLIENT_ID"])

    set_sample_track(client)

    # If we found some tracks, lets show a one
    if @artist.sample_track.present?
      url = @artist.sample_track["permalink_url"]
      @soundcloud_oembed = client.get("/oembed", url: url)
    end
  end
end
