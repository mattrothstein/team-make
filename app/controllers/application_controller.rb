class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_club
  helper :all
  include AthleteSessionsHelper
  include AthletesHelper

  def current_club
    @current_club ||= Club.find_by(session[:club_id])
  end

end
