class Notification < ActiveRecord::Base
  attr_accessible :content, :title

  scope :asc, order("events.created_at ASC")
end
