class SubmitSitesController < ApplicationController
  def new
    @submit_site = SubmitSite.new
  end

  def create
    @submit_site = SubmitSite.new(submit_site_params)
    if @submit_site.save
      # UserSubmittedUpdatesMailer.class_submitted(@submit_site).deliver!
      flash[:notice] = "Thank you for submitting your site. We will email you when we approve it."
      redirect_to sites_path
    else
      flash[:alert] = "Sorry, your site has not been submitted."
      render :new
    end
  end

  def destroy
    @submit_site = SubmitSite.find(params[:id])
    if @submit_site.destroy
      flash[:notice] = "You have successfully deleted this site request."
      redirect_to admin_path
    else
      flash[:alert] = "There was a problem. The site request has not been deleted."
      redirect_to admin_path
    end
  end

  private
    def submit_site_params
      params.require(:submit_site).permit(:user_name, :user_email, :site_name, :site_address, :site_contact, :site_url, :site_description)
    end
end
