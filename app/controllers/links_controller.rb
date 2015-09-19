class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :only_logged_users, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  expose(:user) { User.find_by(id: user_id) }
  expose(:link)
  expose(:links)

  def create
    link = current_user.links.build(link_params)
    link.user = current_user
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

    def only_logged_users
      unless logged_in?
        flash[:danger] = "You must log in first"
        redirect_to login_url
      end
    end

    def correct_user
      user = User.find(params[:id])
        unless user == current_user
          flash[:danger] = "You can change only your own links"
          redirect_to root_url
        end
    end
end
