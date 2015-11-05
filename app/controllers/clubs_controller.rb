class ClubsController < ApplicationController


  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      render :show
    else
      render :new
    end
  end

  def show
    @club
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def club_params
    params.require(:club).permit(:club_name, :sport, :email, :director, :password, :password_confirmation)
  end

end
