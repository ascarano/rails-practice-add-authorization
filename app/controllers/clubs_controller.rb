class ClubsController < ApplicationController
  before_action :require_login
  
  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
  end

  private

  def require_login
    unless current_student
      redirect_to login_path
    end
  end

end
