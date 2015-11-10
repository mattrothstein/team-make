class WelcomeController < ApplicationController
  def index
  end

  def new
    @club = Club.new
  end
end
