module AthleteSessionsHelper

  ## this below logs in the given athlete.
  def log_in(athlete)
    session[:athlete_id] = athlete.id
  end

  # will remember an athlete in a persistent session
  def remember(athlete)
    athlete.remember
    cookies.permanent.signed[:athlete_id] = athlete.id
    cookies.permanent[:remember_token] = athlete.remember_token
  end

  ## this below the athlete which belongs to the remember token cookie
  def current_athlete
    if (athlete_id = session[:athlete_id])
      @current_athlete ||= Athlete.find_by(id: athlete_id)
    elsif (athlete_id = cookies.signed[:athlete_id])
      athlete = Athlete.find_by(id: athlete_id)
        if athlete && athlete.authenticated?(cookies[:remember_token])
          log_in athlete
          @current_athlete = athlete
        end
    end
  end

  # returns true if athlete is logged in
  def logged_in?
    !current_athlete.nil?
  end

 # logs out athlete
  # def log_out
  #   session.delete(:athlete_id)
  #   @current_athlete = nil
  # end
  ## forgets a persistent session
 def forget(athlete)
    athlete.forget
    cookies.delete(:athlete_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_athlete)
    session.delete(:athlete_id)
    @current_athlete = nil
  end
end
