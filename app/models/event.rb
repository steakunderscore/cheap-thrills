class Event < ActiveRecord::Base
  PRICE_REGEX = /\$[[:digit:]]+\.[[:digit:]]{2,}/

  belongs_to :venue
  has_many :artist_events
  has_many :artists, through: :artist_events

  default_scope { order(:starts_at) }
  scope :upcoming, -> { where("starts_at > ?", Time.now.getlocal) }

  validates :venue, presence: true
  validates :starts_at, presence: true
  validates :soldout, inclusion: { in: [true, false],
                                   message: "requires a true or false value" }

  # Returns the price in currency as a float
  def price
    price_cent / 100.0
  end

  def price=(price)
    self.price_cent = if price.is_a?(String) && price.match(PRICE_REGEX)
                        (price.delete("$").to_f * 100).to_i
                      elsif price.is_a?(Float)
                        (float_price * 100).to_i
                      else
                        price
                      end
  end
end
