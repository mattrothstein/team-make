class AthletesController < ApplicationController
  #invites should be destroyed when athlete is destroyed.. so here would  go that dependency invites destroy: :dependent
  before_action :set_spot, only: [:accept_invite, :decline_invite]

  def index
    if params[:search]
      @athlete = Athlete.search(params[:search]).order("created_at DESC")
      redirect_to :back
    else
      @athletes = Athlete.order("created_at DESC") if params[:search].present?
      redirect_to :back
    end
  end

  def search

  end

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)

    if @athlete.save
      session[:athlete_id] = @athlete.id
      flash[:success] = "Welcome to Teammake!"
      redirect_to athlete_path(@athlete)
    else
      render 'new'
    end
  end

  def edit
    @athlete = current_athlete
  end

  def update
    @athlete = current_athlete
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
    @spots = Spot.where({athlete_id: current_athlete.id})
  end

  def destroy
    current_athlete.destroy
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
    @spot = Spot.find(params[:spot_id])
  end


end
