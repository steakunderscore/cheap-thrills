class VenuesController < ApplicationController
  before_action :set_venue, only: [:show]
  before_action :set_upcoming_events, only: [:show]

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_venue
    @venue = Venue.find(params[:id])
  end

  def set_upcoming_events
    @upcoming_events = @venue.events.upcoming
  end
end
