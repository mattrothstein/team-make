class TryoutsController < ApplicationController
  before_action :set_season
  
  def new
    @tryout = Tryout.new
  end

  def create
    @tryout = Tryout.new(tryout_params)
    if @tryout.save
      redirect_to club_season_path(current_club, @season)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
private
def tryout_params
  params.require(:tryout).permit(:location, :date, :time, :season_id)
end
 def set_season
   @season = Season.find(params[:season_id])
 end

end
