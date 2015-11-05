class SessionsController < ApplicationController

  def new
  end


  def create
    @club = Club.find_by(email:(params[:email])).try(:authenticate, params[:password])
    if @club
      session[:club_id] = @club.id
      redirect_to @club, notice: 'Logged in!'
    else
      redirect_to 'clubs/new'
    end
  end

  def destroy
    session[:club_id] = nil
    redirect_to 'clubs/new', notice: 'Logged out!'
  end

end
