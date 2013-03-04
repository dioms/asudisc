class Event < ActiveRecord::Base
  attr_accessible :date, :description, :end_time, :location, :start_time, :title
end
