class TeamsController < ApplicationController
  def index
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to ''
    else

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


end
