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
      redirect_to new_club_season_path(@club)
      flash[:success] = "Welcome to Teammake!"
    else
      render :new
    end
  end

  def show
    @team = Team.new
  end

  def edit
    @club = current_club
  end

  def update
    @club =  current_club
    if @club.update_attributes(club_params)
      flash[:notice] = "Club successfully updated"
      redirect_to club_seasons_path(current_club)
    else
      render 'edit'
    end
  end

  def destroy
    current_club.destroy
      flash[:success] = "Delete successful."
      redirect_to '/'
  end

  private

  def set_club
    @club = current_club
  end

  def club_params
    params.require(:club).permit(:club_name, :sport, :logo, :email, :director, :password, :password_confirmation)
  end

end
