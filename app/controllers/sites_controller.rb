class SitesController < ApplicationController
  def index
    # if params[:sort].present?
    #   if params[:sort] == 'a-z'
    #     @sites = Site.all.order('name ASC')
    #   elsif params[:sort] == 'z-a'
    #     @sites = Site.all.order('name DESC')
    #   end
    # else
    #   @sites = Site.all.order('name ASC')
    # end

    if params[:region].present?
      if params[:region] == 'north-northeast'
        @sites = Site.north_northeast
      elsif params[:region] == 'south-southeast'
        @sites = Site.south_southeast
      elsif params[:region] == 'southwest'
        @sites = Site.southwest
      elsif params[:region] == 'downtown'
        @sites = Site.downtown
      elsif params[:region] == 'gresham'
        @sites = Site.gresham
      elsif params[:region] == 'washington-county'
        @sites = Site.washington_county
      elsif params[:region] == 'clark-county'
        @sites = Site.clark_county
      elsif params[:region] == 'other-areas'
        @sites = Site.other_areas
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
