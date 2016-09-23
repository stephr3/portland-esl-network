class SitesController < ApplicationController
  before_action :is_admin, only:[:new, :edit, :destroy]
  def index
    if params[:region].present?
      if params[:region] == 'north-northeast'
        @sites = Site.north_northeast.order('name ASC')
      elsif params[:region] == 'south-southeast'
        @sites = Site.south_southeast.order('name ASC')
      elsif params[:region] == 'southwest'
        @sites = Site.southwest.order('name ASC')
      elsif params[:region] == 'downtown'
        @sites = Site.downtown.order('name ASC')
      elsif params[:region] == 'gresham'
        @sites = Site.gresham.order('name ASC')
      elsif params[:region] == 'washington-county'
        @sites = Site.washington_county.order('name ASC')
      elsif params[:region] == 'clark-county'
        @sites = Site.clark_county.order('name ASC')
      elsif params[:region] == 'other-areas'
        @sites = Site.other_areas.order('name ASC')
      end
    else
      @sites = Site.all.order('name ASC')
    end
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      flash[:notice] = "You have successfully submitted a class!"
      redirect_to root_path
    else
      flash[:alert] = "We're sorry, your class has not been successfully submitted."
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
      flash[:alert] = "We're sorry, your class updates have not been successfully submitted."
      render :edit
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_path
  end

private
  def site_params
    params.require(:site).permit(:name, :region, :address, :city, :state, :zip, :contact, :phone, :email, :url, :class_resource, :site_type, :description, :happening_now, :summer_classes, :students_served)
  end
end
