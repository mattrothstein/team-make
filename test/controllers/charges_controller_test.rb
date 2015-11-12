require 'test_helper'

class ChargesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get new" do
  	get :new
  	assert_response :success
  end

  test "should create charge" do
  	post :create
  	assert_response :success
  end
end
