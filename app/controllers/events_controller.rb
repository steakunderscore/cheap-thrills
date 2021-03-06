class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.upcoming
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @venue = @event.venue
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end
end
