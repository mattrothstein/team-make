require 'test_helper'

class AthletesControllerTest < ActionController::TestCase
  setup do
    @athlete = athletes(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:athletes)
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create athlete" do
    post :create, athlete: { name: @athlete.name, email: @athlete.email, dob: @athlete.dob, user_name: @athlete.user_name, password: @athlete.password_digest, password_confirmation: @athlete.password_digest}
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @athlete
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @athlete, athlete: { name: @athlete.name, email: @athlete.email, dob: @athlete.dob, user_name: @athlete.user_name, password: @athlete.password_digest, password_confirmation: @athlete.password_digest}
    assert_response :success
  end

  test "should show user" do
    get :show, id: @athlete
    assert_response :success
  end

  # test "should destroy user" do
  #   assert_difference ('Athlete.count', -1) do
  #   delete :destroy, id: @user
  # end

  #   assert_redirected_to athletes_path
  # end

end
