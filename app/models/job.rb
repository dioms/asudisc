class Job < ActiveRecord::Base
  attr_accessible :city, :company_description, :company_name, :company_url, :description, :job_title, :requirements
end
