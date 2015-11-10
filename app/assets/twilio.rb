require 'twilio-ruby'

# To find these visit https://www.twilio.com/user/account
account_sid = "AC18ca5f00335ddb1c8f3991237ae1ec90"
auth_token = "AC3e43e626abf2985a9c4dc7dc692d5208"

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
# Twilio.configure do |config|
#   config.account_sid = account_sid
#   config.auth_token = auth_token
# end

# and then you can create a new client without parameters
# @client = Twilio::REST::Client.new

# @client.messages.create(
#   from: '+15005550006',
#   to: '+17862904928',
#   body: 'Hey there!'
# )

