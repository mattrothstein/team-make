require 'test_helper'

class ClubsControllerTest < ActionController::TestCase
  
  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should create club" do
  #   post :create, club: { club_name: @club.club_name, sport: @club.sport, 
  #                         email: @club.email, director: @club.director, password: @club.password_digest, password_confirmation: @club.password_digest }
  #   assert_response :success
  # end

  # broken code
  # test "should show club" do
  #   get :show, id: @club
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @club
  #   assert_response :success
  # end

  # no route matches
  # test "should update club" do
  #   patch :update, id: @club, club: { club_name: @club.club_name, sport: @club.sport, email: @club.email, director: @club.director, password: @club.password_digest, password_confirmation: @club.password_digest }
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end
end
