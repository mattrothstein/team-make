class Notification

  def self.notify(athlete)

    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    athlete_number = "+1" + athlete.telephone
    athlete_name = athlete.name
    text = "Hello #{athlete_name}, you've been invited to join a team! Check your page for more info."

    message = client.messages.create from: '+12566932035', to: athlete_number, body: text

    AthleteMailer.invite_athlete(athlete.email).deliver_now
  end

end
