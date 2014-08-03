class ReportsController < ApplicationController
  before_filter :authenticate_admin!
  def dues_report
    @paying_members = User.where(has_paid: true)
  end

  def attendance_report
    @events = Event.all
  end

  def recently_registered
    @recently_registered = User.limit(30)
  end

  def index
  end
end