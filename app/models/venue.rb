class Venue < ActiveRecord::Base
  has_many :events

  default_scope { order(:name) }
end
