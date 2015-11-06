class AthleteSessionsController < ApplicationController
  def new
  end

  def create
  athlete = Athlete.find_by(email: params[:athlete_session][:email].downcase)
    if athlete && athlete.authenticate(params[:athlete_session][:password])
      log_in athlete
      params[:athlete_session][:remember_me] == '1' ? remember(athlete) : forget(athlete)
      redirect_to athlete
    else
      flash[:notice] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
