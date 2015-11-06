class TeamsController < ApplicationController
  before_action :set_club

  def index
  end
  def new
    @team = @club.teams.build
  end

  def create
    @team = @club.teams.build(team_params)
    if @team.save
      flash[:notice] = "Team has been created"
      redirect_to 'club/show'
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
    params.require(:team).permit(:name, :age, :coach, :roster_size, :club_id)
  end

  def set_club
    @club = Club.find(params[:club_id])
  end

end
