class ClubsController < ApplicationController
  before_action :set_club, only: [:show]

  def new
    @club = Club.new
    @team = Team.new
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      session[:club_id] = @club.id
      render :show
    else
      render :new
    end
  end

  def show
    @team = Team.new

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_club
    current_club
  end

  def club_params
    params.require(:club).permit(:club_name, :sport, :logo, :email, :director, :password, :password_confirmation)
  end

end
