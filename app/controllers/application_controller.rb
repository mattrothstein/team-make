class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_club
  helper_method :current_season
  helper_method :current_athlete
  # helper :all
  # include AthleteSessionsHelper
  # include AthletesHelper

  def current_club
    @current_club ||= Club.find_by(id: session[:club_id])
  end

  def current_season
    @current_season = current_club.seasons.last
  end


  def current_athlete
    @current_athlete ||= Athlete.find_by(id: session[:athlete_id])
  end
end
