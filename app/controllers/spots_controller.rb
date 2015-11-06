class SpotsController < ApplicationController
  before_action :set_club
  before_action :set_team

  def new
    @spot.new
  end

  def create
    @spot.new(spot_params)
    if @spot.save
      render :back
    else
      render :back
    end
  end

  def destroy
    @spot.delete(params[:id])
  end

  private

  def spot_params
    params.require(:spot).permit(:athlete_id, :team_id, :invite_status)
  end

  def set_club
    @club = Club.find(params[:club_id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

end
