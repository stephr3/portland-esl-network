class VolunteerSitesController < ApplicationController
  before_action :is_admin, only:[:new, :edit, :destroy]
  def index
    # Sort Sites by Level
    if params[:level].present?
      if params[:level] == 'all'
        @sites = VolunteerSite.where(level: 'All').order('name ASC').page(params[:page])
      elsif params[:level] == 'beginner'
        @sites = VolunteerSite.where(level: 'Beginner').order('name ASC').page(params[:page])
      elsif params[:level] == 'intermediate'
        @sites = VolunteerSite.where(level: 'Intermediate').order('name ASC').page(params[:page])
      elsif params[:level] == 'advanced'
        @sites = VolunteerSite.where(level: 'Advanced').order('name ASC').page(params[:page])
      end
    else
      @sites = VolunteerSite.all.order('name ASC').page(params[:page])
    end

    #Init Gmaps
    @hash = Gmaps4rails.build_markers(@sites) do |site, marker|
      marker.infowindow "<b><a href='#{site.url}' target='_blank'>#{site.name}</a></b><p>#{site.address} #{site.city}, #{site.state} #{site.zip}<br>#{site.contact}</p>"
      marker.lat site.latitude
      marker.lng site.longitude
    end
    @center_on = [45.543897, -122.655977]
    @zoom = 9
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
      flash[:alert] = "Sorry, your volunteer site has not been successfully submitted."
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
        format.html { redirect_back(fallback_location: volunteer_sites_path) }
        format.js
      end
    else
      flash[:alert] = "Sorry, your volunteer site updates have not been successfully submitted."
      render :edit
    end
  end

  def destroy
    @site = VolunteerSite.find(params[:id])
    if @site.destroy
      flash[:notice] = "You have successfully deleted your volunteer site."
      redirect_to volunteer_sites_path
    else
      flash[:alert] = "Sorry, your volunteer site has not been deleted."
      redirect_to volunteer_sites_path
    end
  end
private
  def volunteer_site_params
    params.require(:volunteer_site).permit(:name, :address, :city, :state, :zip, :url, :description, :level, :contact)
  end
end
