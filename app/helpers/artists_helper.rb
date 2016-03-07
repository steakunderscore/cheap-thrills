module ArtistsHelper
  def when_and_where(event)
    "#{I18n.l(event.starts_at, format: :long)} at #{event.venue.name}"
  end
end
