class ReportsController < ApplicationController
  before_filter :authenticate_admin!
  def dues_report
    @paying_members = User.select { |u| u.currently_paid? } | 
      User.where(has_paid: true).where("created_at >= ?", Time.now.ago(8.months))
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
