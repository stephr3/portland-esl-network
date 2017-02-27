class PagesController < ApplicationController
  before_action :is_admin, only:[:admin]
  def map
    @sites = Site.where(happening_now: 'Yes')
    #Init Gmaps
    @hash = Gmaps4rails.build_markers(@sites) do |site, marker|
      if site.url != ""
        marker.infowindow "<b>" +
        "<a href='#{site.url}' target='_blank'>" +
         "#{site.name}</a></b><p>#{site.address} #{site.city}, #{site.state} #{site.zip}<br>" +
         "#{site.phone}<br>" +
         "<a href='/sites/#{site.id}' target='_blank'>More Details</a></p>"
      else
        marker.infowindow "<b>#{site.name}</b><p>#{site.address} #{site.city}, #{site.state} #{site.zip}<br>#{site.phone}</p>"
      end
      marker.lat site.latitude
      marker.lng site.longitude
    end
    if params[:center] && params[:center] != ''
      @center = params[:center]
      if (0 < @center.length) and (@center.length < 6) and (@center.is_number?)
        lat = Geocoder.search(@center).first.coordinates.first
        lng = Geocoder.search(@center).first.coordinates.last
        @center_on = [lat, lng]
        @zoom = 13
      else
        flash[:alert] = "Please enter a valid zip code."
        @center_on = [45.543897, -122.655977]
        @zoom = 11
        redirect_to root_path
      end
    else
      @center_on = [45.543897, -122.655977]
      @zoom = 11
    end
  end

  def volunteer
  end

  def about
  end

  def admin
  end
end
