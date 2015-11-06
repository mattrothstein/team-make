class TeamsController < ApplicationController
  before_action :set_club
  before_action :set_team, only: [:show, :edit, :destroy]
  def index
  end

  def new
    @team = @club.teams.build
  end

  def create
    @team = @club.teams.build(team_params)
    if @team.save
      flash[:notice] = "Team has been created"
      redirect_to club_team_path(current_club, @team)
    else
      flash[:alert] = "Team has not been created"
      redirect_to :back
    end
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:name, :age_group, :coach, :roster_size,:season, :club_id)
  end

  def set_club
    @club = Club.find(params[:club_id])
  end

  def set_team
    @team = Team.find(params[:id])
  end

end
