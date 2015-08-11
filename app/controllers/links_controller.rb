class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  expose(:link, attributes: :link_params)
  expose(:links)

  def create
    if link.save
      flash[:notice] = "Link has been created"
      redirect_to link
    else
      flash.now[:alert] = "Link has not been created"
      render 'new'
    end
  end

  def update
    if link.update(link_params)
      flash[:notice] = "Link has been updated"
      redirect_to link
    else
      flash.now[:alert] = "Link has not been updated"
      render 'edit'
    end
  end

  def destroy
    link.destroy

    flash[:notice] = "Link has been deleted"
    redirect_to links_path
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :content)
    end

    def set_link
      link = Link.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The link you looking for cannot be found"
      redirect_to links_path
    end

end
