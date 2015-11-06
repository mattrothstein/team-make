require 'test_helper'

class AthleteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   one = athletes(:one)
  #   puts "Hello #{one.name}"
  
  #   athlete_1 = athletes(:athlete_1)
  #   puts "Hello #{athlete_1.name}"
    
  #   assert true
  # end


  def set_up
    @athlete = Athlete.new(name: "Example Athlete", email: "athlete@email.com",
                             user_name: "athlete", password: "password",
                              password_confirmation: "password")
  end

  test "should be valid" do
    set_up
    assert @athlete.valid?
  end


  test "athlete should have a name" do
    set_up
    @athlete.name = "      "
    assert_not @athlete.valid?
  end

  test "athlete should have an email" do
    set_up
    @athlete.email = "      "
    assert_not @athlete.valid?
  end

  test "name shouldn't be too long" do
    set_up
    @athlete.name = "a" * 51
    assert_not @athlete.valid?
  end

  test "email shouldn't be too long" do
    set_up
    @athlete.email = "a" * 144 + "@example.com"
    assert_not @athlete.valid?
  end

  test "email should have valid format" do
    set_up
    valid_emails = %w[athlete@example.com ATHLETE@club.com
      A_ATHELTE@club.team.org first.last@club.io alice+sally@foobaz.cn]

      valid_emails.each do |valid_email|
        @athlete.email = valid_email
        assert @athlete.valid?, "#{valid_email.inspect} should be valid"
      end
    end

  test "invalid emails should be rejected" do
    set_up
    invalid_emails = %w[athlete@example,com user_at_foo.org user.name@example.
                        athlete@org_club.com athlete@bar+beer.com]

    invalid_emails.each do |invalid_email|
      @athlete.email = invalid_email
      assert_not @athlete.valid?, "#{invalid_email.inspect} should be invalid"
    end
  end

  test "athlete email should be unique" do
    set_up
    duplicate_athlete = @athlete.dup
    duplicate_athlete.email = @athlete.email.downcase
    @athlete.save
    assert_not duplicate_athlete.valid?
  end

  test "athlete should have password" do
    set_up
    @athlete.password = @athlete.password_confirmation = " " * 6
    assert_not @athlete.valid?
  end

  test "password should have minimum length" do
    set_up
    @athlete.password = @athlete.password_confirmation = "a" * 5
    assert_not @athlete.valid?
  end
end
