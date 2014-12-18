class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  
  def current_student
    Student.find_by_id(session[:student_id])
  end

  helper_method :current_student

  def require_login
    unless current_student
      redirect_to login_path
    end
  end

end
