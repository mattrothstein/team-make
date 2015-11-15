class TryoutsController < ApplicationController
  before_action :set_season, except: [:register]
  before_action :set_tryout, only: [:edit, :show, :destroy]
  before_action :set_tryout_register, only: [:register]
  def index
    @tryouts = Tryout.all
    @tryout = Tryout.new
  end

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

  def register
    @evaluated_athlete = EvaluatedAthlete.create({tryout: @tryout, athlete: current_athlete})
    redirect_to current_athlete
  end

private
def tryout_params
  params.require(:tryout).permit(:location, :date, :time, :season_id)
end
 def set_season
   @season = Season.find(params[:season_id])
 end
 def set_tryout_register
   @tryout = Tryout.find(params[:tryout_id])
 end
 def set_tryout
   @tryout = Tryout.find(params[:id])
 end
end
