class Course < ActiveRecord::Base
  attr_accessible :number, :semester, :subject
  belongs_to :user
end
