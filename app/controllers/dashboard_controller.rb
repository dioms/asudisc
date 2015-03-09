class DashboardController < ApplicationController
  http_basic_authenticate_with name: "disc", password: "disc2012"
  def members
    @paid_members = User.where(currenlt_paid: true)
    @non_paid_members = User.where(currently_paid: false)
    @members = User.all
    @general_meetings = Event.where(event_type: "General Meeting")
  end
end
