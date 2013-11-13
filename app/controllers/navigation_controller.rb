class NavigationController < ApplicationController
  def index
    @events = Event.last(3).reverse
    @notification = Notification.last
  end

  def jobs
  end

  def executive_team
  end

  def about
  end

  def donate
  end

  def dues_successful
  end

  def dues_error
  end

  def microsoft
  end

end
