class AthletesController < ApplicationController
  def index
  end

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)

    if @athlete.save
      redirect_to @athlete
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def destroy
  end

  def athlete_params
    params.require(:athlete).permit(:name, :email, :user_name, :dob, :password, :password_confirmation)
  end
end
