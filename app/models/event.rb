class Event < ActiveRecord::Base
  attr_accessible :date, :description, :end_time, :location, :start_time, :title, :status, :event_type
  TYPES = ['Site Tour', 'General Meeting', 'Community Service', 'Social']
  STATUS = ['Publish', 'Draft']
end
