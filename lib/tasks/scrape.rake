require "open-uri"

CHEAPTHRILLS_EVENT_PAGE = "http://www.cheapthrills.ca/news.html".freeze

namespace :scrape do
  desc "Scrape cheapthrills.ca for new events"
  task cheapthrills: :environment do
    doc = Nokogiri::HTML(open(CHEAPTHRILLS_EVENT_PAGE))

    events = doc.css("table table tr")
    events.each do |event|
      row = event.xpath("td")

      sold_out = row[0].children.first.children.first.to_s.strip == "SOLD OUT"
      artists = row[1].children.first.children.first.to_s.strip.split(" + ")
      date = row[2].children.first.children.first.to_s.strip
      time = row[3].children.first.children.first.to_s.strip
      venue = row[4].children.first.children.first.to_s.strip
      price = row[5].children.first.children.first.to_s.strip.
              gsub(/(\$|\.)/, "")

      build_objects(sold_out, artists, date, time, venue, price)
    end
  end
end

def parse_start_time(date, time)
  dom, month, year = date.split("-")
  year, dom = [year, dom].map(&:to_i)
  hour, minute = time.split(":").map(&:to_i)
  year += 2000 # For goodness sake

  # Assume timezone of -5
  Time.new(year, month, dom, hour, minute, 0, "-05:00")
end

def build_objects(sold_out, artist_names, date, time, venue_name, price)
  # skip if it's the heading row
  return if artist_names.first == "ARTIST"

  starts_at = parse_start_time(date, time)

  Event.transaction do
    venue = Venue.find_or_create_by(name: venue_name)
    event = Event.find_or_create_by(venue: venue, starts_at: starts_at)
    event.update(price: price, soldout: sold_out)
    artist_names.map do |artist_name|
      artist = Artist.find_or_create_by(name: artist_name)
      event.artist_events.find_or_create_by(artist: artist)
    end
  end
end
