class WelcomeController < ApplicationController
  def index
  end

  def new
    @club = Club.new
    @athlete = Athlete.new
  end
end
