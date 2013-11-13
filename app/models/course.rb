class Course < ActiveRecord::Base
  attr_accessible :number, :semester, :subject, :name, :start, :professor
  belongs_to :users
end
