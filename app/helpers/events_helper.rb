module EventsHelper
  def event_title(event)
    artists_name = event.artists.map(&:name).join(" + ")
    "#{artists_name} playing at #{event.venue.name}"
  end

  def nice_soldout(soldout)
    soldout ? "All gone" : "Not yet"
  end
end
