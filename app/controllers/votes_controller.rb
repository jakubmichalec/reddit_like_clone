class VotesController < ApplicationController
  before_action :only_logged_users, only: [:create]

  expose(:link)
  expose(:vote) do
    link.votes.where(user_id: current_user.id).first
  end

  def vote_on
    if vote
      vote.update_attribute(:value, params[:value])
    else
      vote = current_user.votes.create(value: params[:value],
                                link: link, user: current_user)
    end
    respond_to do |format|
      format.html do
        redirect_to :back
      end
      format.js
    end
  end
end
