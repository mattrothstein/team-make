class ChargesController < ApplicationController
	def new
		# This will remain empty unless you need to set some instance variables to pass on
	end

	def create
		# your charge code will live here
		# Amount in cents
		@amount = params[:amount]

		customer = Stripe::Customer.create(
			:email 	=> params[:stripeEmail],
			:source => params[:stripeToken]
			)

		charge = Stripe::Charge.create(
			:customer 		=> customer.id,
			:amount 			=> @amount,
			:description	=> 'Rails Stripe customer',
			:currency			=> 'usd'
			)

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new charge_path
	end
end
