class SpotsController < ApplicationController
  before_action :set_club
  before_action :set_team

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @athlete = Athlete.find(params[:spot][:athlete_id])
    if @spot.save
      Notification.notify(@athlete)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @spot.delete(params[:id])
  end

  def show

  end

  def accept_offer
    @athlete.spot.update_attributes invite_status: 1
  end
  private

  def spot_params
    params.require(:spot).permit(:athlete_id, :team_id, :invite_status)
  end

  def set_club
    @club = current_club
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

end
