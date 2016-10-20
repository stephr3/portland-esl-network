class LinksController < ApplicationController
  before_action :is_admin, only:[:new, :edit, :destroy]
  def index
    if params[:type].present?
      if params[:type] == 'learning'
        @links = Link.where(page: 'Student Learning Resources')
        render :learning
      elsif params[:type] == 'teaching'
        @links = Link.where(page: 'Teaching Resources')
        render :teaching
      elsif params[:type] == 'refugees'
        @links = Link.where(page: 'Refugee Backgrounders')
        render :refugees
      end
    end
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "You have successfully submitted a link!"
      redirect_to admin_path
    else
      flash[:alert] = "We're sorry, your link has not been successfully submitted."
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:notice] = "Your link updates have been successfully submitted."
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:alert] = "We're sorry, your link updates have not been successfully submitted."
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    if @link.destroy
      flash[:notice] = "You have successfully deleted your link."
      redirect_to admin_path
    else
      flash[:alert] = "There was a problem. Your link has not been deleted."
      redirect_to :back
    end
  end
private
  def link_params
    params.require(:link).permit(:page, :title, :url, :description, :tag)
  end
end
