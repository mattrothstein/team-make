class TeamsController < ApplicationController
  before_action :set_club

  def index
  end
  def new
    @team = current_club.teams.build
  end

  def create
    @team = @club.teams.build(team_params)
    if @team.save
      redirect_to 'club/show'
    else
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
    current_club
  end

end
