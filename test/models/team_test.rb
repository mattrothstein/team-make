require 'test_helper'

class TeamTest < ActiveSupport::TestCase

	setup do
		@team = Team.new(age_group: 13, roster_size: 15,
										 name: "Example Team", coach: "Example Coach")
	end

	test "team should be valid" do
		assert @team.valid?
	end

	test "age_group shouldn't be too young" do
		@team.age_group = 9
		assert_not @team.valid?
	end

	test "age_group shouldn't be too old" do
		@team.age_group = 18
		assert_not @team.valid?
	end

	test "age_group should be a number" do
		@team.age_group = "asdf898uf"
		assert_not @team.valid?
	end

	test "team needs a roster_size" do
		@team.roster_size = "      "
		assert_not @team.valid?
	end

	test "team needs a name" do
		@team.name = "      "
		assert_not @team.valid?
	end

	test "team name must be unique" do
		team_duplicate = @team.dup
		team_duplicate.name = @team.name
		@team.save
		assert_not team_duplicate.valid?
	end

	test "team should have a coach" do
		@team.coach = "      "
		assert_not @team.valid?
	end
end
