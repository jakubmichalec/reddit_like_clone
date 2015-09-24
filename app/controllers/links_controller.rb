class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :only_logged_users, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  expose(:user)
  expose(:link)
  expose(:links) { Link.includes(:user, comments: :user) } #n+1
  expose(:comment) { Comment.new }
  expose(:comments, ancestor: :link)

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
      params.require(:link).permit(:title, :url, :content, :user_id)
    end

    def set_link
      link = Link.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The link you looking for cannot be found"
      redirect_to links_path
    end

    def correct_user
      unless link.user == current_user
        flash[:danger] = "You can change only your own links"
        redirect_to root_url
      end
    end
end
