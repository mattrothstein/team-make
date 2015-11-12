require 'twilio-ruby'


client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    from = '+12566932035'

    friends = {


    }

    friends.each do |key, value|
      client.account.messages.create(
        :from => from,
        :to => key,
        :body => "Hi #{value}.. I'm watching you.."
      )
    end

