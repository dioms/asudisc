class ProfileController < ApplicationController
  def index
    @users = User.find(:all, :order => "email asc")
  end

  def show
    @user = User.find(params[:id])
    @events = Event.last(3).reverse
    @jobs = Job.last(3)
  end
end
