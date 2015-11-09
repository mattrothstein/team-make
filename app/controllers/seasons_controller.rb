class SeasonsController < ApplicationController
  def new
    @season = Season.new

  end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to club_season_path(current_club, @season)
    else
      render :new
    end
  end

  def destroy
  end

  def show
    @season = Season.find(params[:id])
        @team = Team.new
  end

  private

  def season_params
    params.require(:season).permit(:year, :club_id)
  end

end
