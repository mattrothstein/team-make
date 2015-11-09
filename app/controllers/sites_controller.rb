class SitesController < ApplicationController

  def search
    @results = []
    return if params[:athlete].blank?
    @athletes = Athlete.where("name like ?", "%#{params[:athlete]}%")
    @results = @athletes
  end

end
