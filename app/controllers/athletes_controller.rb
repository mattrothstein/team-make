class AthletesController < ApplicationController
  #invites should be destroyed when athlete is destroyed.. so here would go that dependency invites destroy: :dependent

  def index
  end

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)

    if @athlete.save
      log_in @athlete
      remember @athlete
      flash[:success] = "Welcome to Teammake!"
      redirect_to @athlete
    else
      render 'new'
    end
  end

  def edit
    @athlete = Athlete.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:id])
    if @athlete.update_attributes(athlete_params)
      flash[:notice] = "Profile successfully updated"
      redirect_to @athlete
    else
      render 'edit'
    end
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def destroy
    Athlete.find(params[:id]).destroy
      flash[:success] = "Delete successful."
      redirect_to '/'
  end

  def athlete_params
    params.require(:athlete).permit(:avatar, :name, :email, :user_name, :dob, :password, :password_confirmation)
  end
end
