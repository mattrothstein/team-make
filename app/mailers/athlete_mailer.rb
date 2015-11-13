class AthleteMailer < ApplicationMailer
  default from: "no-reply@example.com"

  def invite_athlete(email)
    mail({
      to: email,
      subject: "Hello, you've been invited to join a team! Check your page for more info."
    })
  end
end
