require 'test_helper'

class ClubTest < ActiveSupport::TestCase
	setup do
    @club = Club.new(club_name: "Example Club", director: "Example Director",
	                   email: "club@email.com", password: "password")
  end

	test "should be valid" do
    assert @club.valid?
  end

  test "club should have name" do
    @club.club_name = "      "
    assert_not @club.valid?
  end

  test "club should have a director" do
  	@club.director = "      "
  	assert_not @club.valid?
  end

  test "club name should be unique" do
    duplicate_club = @club.dup
    @club.save
    assert_not duplicate_club.valid?
  end

  test "club should have an email" do
    @club.email = "      "
    assert_not @club.valid?
  end

  test "email shouldn't be too long" do
    @club.email = "a" * 144 + "example.com"
    assert_not @club.valid?
  end

  test "email should have valid format" do
    valid_emails = %w[club@example.com CLUB@club.com A_CLUB@club.team.org 										first.last@club.io alice+sally@foobaz.cn]

    valid_emails.each do |valid_email|
      @club.email = valid_email
      assert @club.valid?, "#{valid_email.inspect} should be valid"
    end
  end

  test "invalid emails should be rejected" do
    invalid_emails = %w[club@example,com CLUB_at_club.com 
                        A_CLUB@club.team. club@org_example.com,
                        club@bar+beer.com]
    invalid_emails.each do |invalid_email|
      @club.email = invalid_email
      assert_not @club.valid?, "#{invalid_email.inspect} should be rejected."
    end                        
  end

  test "club email should be unique" do
    duplicate_club = @club.dup
    duplicate_club.email = @club.email.downcase
    @club.save
    assert_not duplicate_club.valid?
  end

  test "club should have password" do
    @club.password = @club.password_confirmation = " " * 6
    assert_not @club.valid?
  end

  test "club password should have a minimum length" do
    @club.password = @club.password_confirmation = " " * 5
    assert_not @club.valid?
  end
end
