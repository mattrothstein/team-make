class AthletesController < ApplicationController
  #invites should be destroyed when athlete is destroyed.. so here would  go that dependency invites destroy: :dependent
  before_action :set_spot, only: [:accept_invite, :decline_invite]

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
    @clubs = Club.all
    @athlete = Athlete.find(params[:id])
  end

  def destroy
    Athlete.find(params[:id]).destroy
      flash[:success] = "Delete successful."
      redirect_to '/'
  end

    def accept_invite
      @spot.invite_status = "accept"
      redirect_to current_athlete
      @spot.save
    end

  def decline_invite
    @spot.invite_status = "decline"
    redirect_to current_athlete
    @spot.save
  end

  private
  def athlete_params
    params.require(:athlete).permit(:avatar, :name, :email, :user_name, :telephone, :dob, :password, :password_confirmation)
  end

  def set_spot
    @spot = current_athlete.spot
  end


end
