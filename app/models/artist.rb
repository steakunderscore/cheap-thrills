class Artist < ActiveRecord::Base
  has_many :artist_events
  has_many :events, through: :artist_events

  default_scope { order(:name) }
end
