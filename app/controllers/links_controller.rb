class LinksController < ApplicationController
  before_action :is_admin, only:[:new, :edit, :destroy]
  def index
    if params[:type].present?
      if params[:type] == 'learning'
        @general = Link.where(page: 'Student Learning Resources').where(tag: 'General')
        @listening = Link.where(page: 'Student Learning Resources').where(tag: 'Listening')
        @pronunciation = Link.where(page: 'Student Learning Resources').where(tag: 'Pronunciation')
        @writing = Link.where(page: 'Student Learning Resources').where(tag: 'Writing')
        @literacy = Link.where(page: 'Student Learning Resources').where(tag: 'Literacy')
        @GED = Link.where(page: 'Student Learning Resources').where(tag: 'GED')
        @computer = Link.where(page: 'Student Learning Resources').where(tag: 'Computer Skills')
        @citizenship = Link.where(page: 'Student Learning Resources').where(tag: 'Citizenship Classes')
        render :learning
      elsif params[:type] == 'teaching'
        @links = Link.where(page: 'Teaching Resources').page(params[:page])
        render :teaching
      elsif params[:type] == 'refugees'
        @links = Link.where(page: 'Refugee Backgrounders').page(params[:page])
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
      flash[:alert] = "Sorry, your link has not been successfully submitted."
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
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
    else
      flash[:alert] = "Sorry, your link updates have not been successfully submitted."
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
      redirect_back(fallback_location: admin_path)
    end
  end
private
  def link_params
    params.require(:link).permit(:page, :title, :url, :description, :tag)
  end
end
