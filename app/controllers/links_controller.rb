class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      flash[:notice] = "Link has been created"
      redirect_to @link
    else
      flash.now[:alert] = "Link has not been created"
      render 'new'
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      flash[:notice] = "Link has been updated"
      redirect_to @link
    else
      flash.now[:alert] = "Link has not been updated"
      render 'edit'
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :content)
    end

end
