class SitesController < ApplicationController
  before_action :is_admin, only:[:new, :edit, :destroy]

  def index

    # Sort Sites by Region
    if params[:region].present?
      if params[:region] == 'north-northeast'
        @sites = Site.north_northeast.order('name ASC').page(params[:page])
      elsif params[:region] == 'south-southeast'
        @sites = Site.south_southeast.order('name ASC').page(params[:page])
      elsif params[:region] == 'southwest'
        @sites = Site.southwest.order('name ASC').page(params[:page])
      elsif params[:region] == 'downtown'
        @sites = Site.downtown.order('name ASC').page(params[:page])
      elsif params[:region] == 'gresham'
        @sites = Site.gresham.order('name ASC').page(params[:page])
      elsif params[:region] == 'washington-county'
        @sites = Site.washington_county.order('name ASC').page(params[:page])
      elsif params[:region] == 'clark-county'
        @sites = Site.clark_county.order('name ASC').page(params[:page])
      elsif params[:region] == 'other-areas'
        @sites = Site.other_areas.order('name ASC').page(params[:page])
      end
    else
      @sites = Site.all.order('name ASC').page(params[:page])
    end

    if params[:site].present?
      @sites = Site.fuzzy_search(name: params[:site]).page(params[:page])
    end
  end

  def show
    @site = Site.find(params[:id])
    #Init Gmaps
    @hash = Gmaps4rails.build_markers(@site) do |site, marker|
      marker.infowindow "<b>#{site.name}</b><p>#{site.address} #{site.city}, #{site.state} #{site.zip}<br>#{site.contact}</p>"
      marker.lat site.latitude
      marker.lng site.longitude
    end
    @center_on = [@site.latitude, @site.longitude]
    @zoom = 13
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      flash[:notice] = "You have successfully submitted a class!"
      redirect_to sites_path
    else
      flash[:alert] = "Sorry, your class has not been successfully submitted."
      render :new
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      flash[:notice] = "You have successfully submitted your updates for this class."
      redirect_to site_path(@site)
    else
      flash[:alert] = "Sorry, your class updates have not been successfully submitted."
      render :edit
    end
  end

  def destroy
    @site = Site.find(params[:id])
    if @site.destroy
      flash[:notice] = "You have successfully deleted this class."
      redirect_to sites_path
    else
      flash[:alert] = "There was a problem. The class has not been deleted."
      redirect_to sites_path
    end
  end

  def autocomplete
    @site_search = Site.order(:name).where("name ILIKE ?", "%#{ params[:term] }%")
    respond_to do |format|
      format.html
      format.json {
        render json: @site_search.map(&:name).to_json
      }
    end
  end

private
  def site_params
    params.require(:site).permit(:name, :region, :address, :city, :state, :zip, :contact, :phone, :email, :url, :class_resource, :site_type, :description, :happening_now, :summer_classes, :students_served)
  end
end
