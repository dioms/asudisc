module Semesters
  def current_semester
    date_to_semester(Date.today)
  end

  def date_to_semester(date)
    month = date.month > 7 && date.month < 13 ? "Fall" : "Spring"
    "#{month} #{date.year}"
  end

  def next_semester
    date_to_semester(Date.today + 6.months)
  end
end
