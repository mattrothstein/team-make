require 'test_helper'

class AthleteMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "invite athlete" do
    target_email = "email@example.com"
    email = AthleteMailer.invite_athlete(target_email).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal [target_email], email.to
    assert_equal "Hello, you've been invited to join a team! Check your page for more info.", email.subject
  end
end
