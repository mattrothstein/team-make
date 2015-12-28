require 'test_helper'

class TryoutTest < ActiveSupport::TestCase

	setup do
		@tryout = Tryout.new(location: "Example City", date: "2015-11-09",
												 time: "Example Time", price: 50)
	end

	test "tryout should be valid" do
		assert @tryout.valid?, "Tryout was not saved..."
	end

	test "price must be an integer" do
		@tryout.price = 50.5
		assert_not @tryout.valid?
	end

end
