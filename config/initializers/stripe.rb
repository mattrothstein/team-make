# configuring the application makes use of your publishable and secret API keys.
Rails.configuration.stripe = {
	:publishable_key => ENV['PUBLISHABLE_KEY'],
 	:secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
