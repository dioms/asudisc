class ProfileController < ApplicationController

  #layout "user_panel"

  def index
    @users = User.find(:all, :order => "email asc")
  end

  def show
    @user = User.find(params[:id])
    @courses = current_user.courses
    @events = Event.order("date DESC").limit(3)
    @jobs = Job.last(3)
  end

  def make_admin
    @user = User.find(params[:id])
    @user.admin = true
    respond_to do |format|
      if current_user.try(:admin?) && @user.save
        format.html { redirect_to members_path, notice: 'User was successfully updated.' }
      else
        format.html { redirect_to members_path, alert: 'There was an error updating the user' }
      end
    end
  end

  def dues
  end

  def dues_successful
  end

  def dues_error
  end
end
