class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :artist_events
  has_many :artists, through: :artist_events

  scope :upcoming, -> { where("starts_at > ?", Time.now.getlocal) }
end
