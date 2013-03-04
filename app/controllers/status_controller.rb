class StatusController < ApplicationController
  def user
    @users = User.all
  end
end
