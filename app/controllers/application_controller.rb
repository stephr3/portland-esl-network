class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_admin
	  @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

  def is_admin
    if !current_admin
      flash[:alert] = 'You must log in as an admin to do this task'
      redirect_to log_in_path
    end
  end

  helper_method :current_admin
end
