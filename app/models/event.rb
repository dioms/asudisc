class Event < ActiveRecord::Base

  has_many :rsvps
  has_many :user_rsvps, through: :rsvps, source: :user
  has_and_belongs_to_many :users


  validates :title, :start_time, :date, :description, :location,  :presence => true

  attr_accessible :date, :description, :end_time, :location, :start_time, :title, :status, :event_type
  TYPES = ['Site Tour', 'General Meeting', 'Community Service', 'Social']
  STATUS = ['Publish', 'Draft']

  scope :asc, order("events.date ASC")

  def pretty_start_time
    DateTime.new(self.date.year, self.date.month, self.date.day, self.start_time.hour, self.start_time.min, self.start_time.sec) + 7.hours #sketch
  end
  def pretty_end_time
    DateTime.new(self.date.year, self.date.month, self.date.day, self.end_time.hour, self.end_time.min, self.end_time.sec) + 7.hours #sketch
  end
end
