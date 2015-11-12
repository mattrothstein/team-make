class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token


  def notify(athlete)

    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    text = "You've been invited to join a team! Check your page for more info."

    athlete_number = "+1" + athlete.telephone

    message = client.messages.create from: '+12566932035', to: athlete_number, body: text

    render plain: message.body
  end

end



# from = "+14159998888" # Your Twilio number


# friends.each do |key, value|
#   client.account.messages.create(
#     :from => from,
#     :to => get_athletes,
#     :body => "Hey #{value}, you been invited to join #{team}! Check your profile to accept or decline invitation."
#   )
#   puts "Sent message to #{value}"
# end




