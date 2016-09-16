class SessionsController < ApplicationController
  def new
  end

  def create
    @admin = Admin.authenticate(params[:username], params[:password])
    if @admin
      flash[:notice] = "You've been logged in as an admin."
      session[:admin_id] = @admin.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem with your login."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end
end
