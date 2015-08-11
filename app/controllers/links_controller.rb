class LinksController < ApplicationController
  def index
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

  private

    def link_params
      params.require(:link).permit(:title, :url, :content)
    end

end
