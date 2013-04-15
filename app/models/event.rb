class Event < ActiveRecord::Base

  has_and_belongs_to_many :users

  attr_accessible :date, :description, :end_time, :location, :start_time, :title, :status, :event_type
  TYPES = ['Site Tour', 'General Meeting', 'Community Service', 'Social']
  STATUS = ['Publish', 'Draft']
end
