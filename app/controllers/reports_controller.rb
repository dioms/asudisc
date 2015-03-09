class ReportsController < ApplicationController
  before_filter :authenticate_admin!
  def dues_report
    @paying_members = User.where(currently_paid: true)
  end

  def attendance_report
    @events = Event.order('date DESC')
  end

  def rsvp_report
    @events = Event.order('date DESC')
  end

  def recently_registered
    @recently_registered = User.order('created_at DESC')
  end

  def index
  end
end
