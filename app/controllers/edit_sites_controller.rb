class EditSitesController < ApplicationController
  attr_reader :site_id
  def new
    @site = Site.find(55)
    @edit_site = EditSite.new
  end

  def create
    @site = Site.find(params[:edit_site][:site_id].to_i)
    @edit_site = EditSite.new(edit_site_params)
    if @edit_site.save
      # UserSubmittedUpdatesMailer.class_updated(@site, @edit_site).deliver!
      flash[:notice] = "Thank you for submitting your updates for this site. We will email you when we approve the changes."
      redirect_to site_path(@site)
    else
      flash[:alert] = "Sorry, your updates have not been submitted."
      render :new
    end
  end

  def destroy
    @edit_site = EditSite.find(params[:id])
    if @edit_site.destroy
      flash[:notice] = "You have successfully deleted this site update request."
      redirect_to admin_path
    else
      flash[:alert] = "There was a problem. The site update request has not been deleted."
      redirect_to admin_path
    end
  end

  private
    def edit_site_params
      params.require(:edit_site).permit(:user_name, :user_email, :site_updates)
    end
end
