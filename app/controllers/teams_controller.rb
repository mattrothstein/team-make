class TeamsController < ApplicationController
  before_action :set_season
  before_action :set_club
  before_action :set_team, only: [:show, :edit, :destroy]
  def index
  end

  def new
    @team = @season.teams.build
    @spot = Spot.new
  end

  def create
    @team = @season.teams.build(team_params)
    if @team.save
      redirect_to club_season_team_path(current_club, @season, @team)
    else
      redirect_to :back
    end
  end

  def show
    @tryouts = Tryout.all
    @spot = Spot.new
    @spots = Spot.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:name, :age_group, :coach, :roster_size, :season_id)
  end

  def set_club
    @club = current_club
  end

  def set_season
    @season = Season.find(params[:season_id])
  end

  def set_team
    @team = Team.find(params[:id])
  end

end
