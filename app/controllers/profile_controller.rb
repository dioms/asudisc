class ProfileController < ApplicationController
  def index
    @users = User.find(:all, :order => "email asc")
  end

  def show
    @user = User.find(params[:id])
  end
end
