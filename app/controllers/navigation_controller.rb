class NavigationController < ApplicationController
  def index
    @events = Event.last(3).reverse
  end

  def jobs
  end

  def executive_team
  end

  def about
  end

  def donate
  end

end
