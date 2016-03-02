class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :artist_events
  has_many :artists, through: :artist_events

  default_scope { order(:starts_at) }
  scope :upcoming, -> { where("starts_at > ?", Time.now.getlocal) }

  validates :venue, presence: true
  validates :starts_at, presence: true
  validates :soldout, inclusion: { in: [true, false],
                                   message: "requires a true or false value" }
end
