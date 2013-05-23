module ApplicationHelper
  def expected_graduation(start_year, end_year) 
    result = []
    part_of_year = ['Spring', 'Summer', 'Fall']
    start_year.upto(end_year) do | year|
    part_of_year.each do |part|
      result << "#{part} #{year}"
    end
    end
    result
  end
end
