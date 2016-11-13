class SitesController < ApplicationController
  before_action :is_admin, only:[:new, :edit, :destroy]

  def index

    # Sort Sites by Region
    if params[:region].present?
      if params[:region] == 'north-northeast'
        if current_admin
          @sites = Site.north_northeast.order('name ASC').page(params[:page])
        else
          @sites = Site.north_northeast.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'south-southeast'
        if current_admin
          @sites = Site.south_southeast.order('name ASC').page(params[:page])
        else
          @sites = Site.south_southeast.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'southwest'
        if current_admin
          @sites = Site.southwest.order('name ASC').page(params[:page])
        else
          @sites = Site.southwest.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'downtown'
        if current_admin
          @sites = Site.downtown.order('name ASC').page(params[:page])
        else
          @sites = Site.downtown.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'gresham'
        if current_admin
          @sites = Site.gresham.order('name ASC').page(params[:page])
        else
          @sites = Site.gresham.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'washington-county'
        if current_admin
          @sites = Site.washington_county.order('name ASC').page(params[:page])
        else
          @sites = Site.washington_county.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'clark-county'
        if current_admin
          @sites = Site.clark_county.order('name ASC').page(params[:page])
        else
          @sites = Site.clark_county.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'other-areas'
        if current_admin
          @sites = Site.other_areas.order('name ASC').page(params[:page])
        else
          @sites = Site.other_areas.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      end
    else
      if current_admin
        @sites = Site.all.order('name ASC').page(params[:page])
      else
        @sites = Site.where(happening_now: 'Yes').order('name ASC').page(params[:page])
      end
    end

    if params[:site].present?
      if current_admin
        @sites = Site.all.fuzzy_search(name: params[:site]).page(params[:page])
      else
        @sites = Site.where(happening_now: 'Yes').fuzzy_search(name: params[:site]).page(params[:page])
      end
    end
  end

  def show
    @site = Site.find(params[:id])
    #Init Gmaps
    @hash = Gmaps4rails.build_markers(@site) do |site, marker|
      if site.url != ""
        marker.infowindow "<b>" +
        "<a href='#{site.url}' target='_blank'>" +
         "#{site.name}</a></b><p>#{site.address} #{site.city}, #{site.state} #{site.zip}<br>#{site.phone}</p>"
      else
        marker.infowindow "<b>#{site.name}</b><p>#{site.address} #{site.city}, #{site.state} #{site.zip}<br>#{site.phone}</p>"
      end
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
    if current_admin
      @site_search = Site.all.order(:name).where("name ILIKE ?", "%#{ params[:term] }%")
    else
      @site_search = Site.where(happening_now: 'Yes').order(:name).where("name ILIKE ?", "%#{ params[:term] }%")
    end
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
