class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendees, foreign_key: 'attended_event_id'
  has_many :users, through: :attendees, source: :attendee

  scope :past, -> { where("date < date('now')") }
  scope :upcoming, -> { where("date >= date('now')") }
end
