class AthleteMailer < ApplicationMailer
  default from: "team@teammake.com"

  def invite_athlete(athlete_email)
    @athlete = athlete_email

    mail({
      to: @athlete,
      subject: "Invite From Teammake"
    })
  end
end
