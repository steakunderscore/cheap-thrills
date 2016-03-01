class ArtistEvent < ActiveRecord::Base
  @table_name = "artists_events"

  belongs_to :artist
  belongs_to :event
end
