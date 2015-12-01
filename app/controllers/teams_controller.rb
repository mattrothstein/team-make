class TeamsController < ApplicationController
  before_action :set_season
  before_action :set_club
  before_action :set_team, only: [:show, :edit, :destroy, :update]
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
    @tryouts = @season.tryouts.all
    @spot = Spot.new
    @spots = Spot.includes(:athlete).where(team: @team)
  end

  def edit
  end

  def update
    if @team.update_attributes(team_params)
      flash[:notice] = "Team successfully updated"
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team.destroy
    flash[:success] = "Team successfully deleted."
    redirect_to @season
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
