class NavigationController < ApplicationController
  def index
    @jobs = Job.last(3).reverse
  end

  def jobs
  end

  def executive_team
  end

  def about
  end
end
