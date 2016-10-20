class VolunteerSitesController < ApplicationController
  before_action :is_admin, only:[:new, :edit, :destroy]
  def index
    @sites = VolunteerSite.all.order('name ASC').page(params[:page])
  end

  def new
    @site = VolunteerSite.new
  end

  def create
    @site = VolunteerSite.new(volunteer_site_params)
    if @site.save
      flash[:notice] = "You have successfully submitted a volunteer site!"
      redirect_to admin_path
    else
      flash[:alert] = "We're sorry, your volunteer site has not been successfully submitted."
      render :new
    end
  end

  def show
    @site = VolunteerSite.find(params[:id])
  end

  def edit
    @site = VolunteerSite.find(params[:id])
  end

  def update
    @site = VolunteerSite.find(params[:id])
    if @site.update(volunteer_site_params)
      flash[:notice] = "Your volunteer site has been successfully updated."
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:alert] = "We're sorry, your volunteer site updates have not been successfully submitted."
      render :edit
    end
  end

  def destroy
    @site = VolunteerSite.find(params[:id])
    if @site.destroy
      flash[:notice] = "You have successfully deleted your volunteer site."
      redirect_to volunteer_sites_path
    else
      flash[:alert] = "We're sorry, your volunteer site has not been deleted."
      redirect_to volunteer_sites_path
    end
  end
private
  def volunteer_site_params
    params.require(:volunteer_site).permit(:name, :address, :url, :description, :level, :contact)
  end
end
