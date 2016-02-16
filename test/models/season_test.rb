require 'test_helper'

class SeasonTest < ActiveSupport::TestCase

	setup do
		@season = Season.new(year: 2015)
	end

	test "season should be valid" do
		assert @season.valid?
	end

	test "season should have a year" do
		@season.year = "      "
		assert_not @season.valid?
	end

	test "season year should be a number" do
		@season.year = "twenty fifteen"
		assert_not @season.valid?
	end

	test "new season should not be from the past" do
		@season.year = 2010
		assert_not @season.valid?
	end

end
