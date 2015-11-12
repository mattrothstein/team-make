module AthletesHelper

  def age(dob)
    @athlete = current_athlete
    now = Time.now.utc.to_date
    now.year - @athlete.dob.year - ((now.month > @athlete.dob.month || (now.month == @athlete.dob.month && now.day >= @athlete.dob.day)) ? 0 : 1)
  end

  def get_age
  end
end
