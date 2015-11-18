class ChargesController < ApplicationController
	# before_action :set_tryout
	def new
		# This will remain empty unless you need to set some instance variables to pass on
		@tryout = Tryout.find(params[:tryout])
	end

	def create
		@tryout = Tryout.find(params[:tryout_id])

		# your charge code will live here
		# Amount in cents
		@amount = @tryout.price

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

			render json: { url: tryout_register_path(@tryout, current_athlete) }

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new charge_path
	end

	private
	# def set_tryout
	# 	@tryout = Tryout.find(params[:id])
	# end
end
