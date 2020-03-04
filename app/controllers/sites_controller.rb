class SitesController < ApplicationController
  before_action :is_admin, only:[:new, :edit, :destroy]

  def index
    # Sort Sites by Region
    if params[:region].present?
      if params[:region] == 'north-northeast'
        @selected_search = 'North/Northeast'
        if current_admin
          @sites = Site.north_northeast.order('name ASC').page(params[:page])
        else
          @sites = Site.north_northeast.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'south-southeast'
        @selected_search = 'South/Southeast'
        if current_admin
          @sites = Site.south_southeast.order('name ASC').page(params[:page])
        else
          @sites = Site.south_southeast.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'southwest'
        @selected_search = 'Southwest'
        if current_admin
          @sites = Site.southwest.order('name ASC').page(params[:page])
        else
          @sites = Site.southwest.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'downtown'
        @selected_search = 'Downtown'
        if current_admin
          @sites = Site.downtown.order('name ASC').page(params[:page])
        else
          @sites = Site.downtown.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'gresham'
        @selected_search = 'Gresham'
        if current_admin
          @sites = Site.gresham.order('name ASC').page(params[:page])
        else
          @sites = Site.gresham.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'washington-county'
        @selected_search = 'Washington County'
        if current_admin
          @sites = Site.washington_county.order('name ASC').page(params[:page])
        else
          @sites = Site.washington_county.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'clark-county'
        @selected_search = 'Clark County'
        if current_admin
          @sites = Site.clark_county.order('name ASC').page(params[:page])
        else
          @sites = Site.clark_county.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      elsif params[:region] == 'other-areas'
        @selected_search = 'Other Areas'
        if current_admin
          @sites = Site.other_areas.order('name ASC').page(params[:page])
        else
          @sites = Site.other_areas.where(happening_now: 'Yes').order('name ASC').page(params[:page])
        end
      end
    # Sort Sites by In Session
    elsif params[:happening].present?
      @selected_search = 'Choose a Region'
      if params[:happening] == 'in-session'
        @sites = Site.in_session.order('name ASC').page(params[:page])
      elsif params[:happening] == 'not-in-session'
        @sites = Site.not_in_session.order('name ASC').page(params[:page])
      end
    elsif params[:volunteers_needed].present?
      @selected_search = 'Choose a Region'
      @sites = Site.where(volunteers_needed: true).order('name ASC').page(params[:page])
    else
      @selected_search = 'Choose a Region'
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
    regions_dict = {
                    'North/Northeast':'north-northeast', 
                    'South/Southeast':'south-southeast', 
                    'Southwest':'southwest',
                    'Downtown':'downtown',
                    'Gresham':'gresham',
                    'Washington County':'washington-county',
                    'Clark County':'clark-county',
                    'Other Areas':'other-areas'
                  }.stringify_keys

    @region_link = regions_dict[@site.region]

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
      # ClassUpdateMailer.class_created(@site).deliver!
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
      # ClassUpdateMailer.class_updated(@site).deliver!
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

private
  def site_params
    params.require(:site).permit(:name, :region, :address, :city, :state, :zip, :contact, :phone, :email, :url, :class_resource, :site_type, :description, :happening_now, :summer_classes, :students_served, :notes, :volunteers_needed, :vol_coordinator_name, :vol_contact, :vol_time_commitment, :vol_time_slots, :vol_assignment_type, :vol_training_offered)
  end
end
