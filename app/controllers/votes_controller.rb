class VotesController < ApplicationController
  before_action :only_logged_users, only: [:create]

  expose(:link)
  expose(:vote) do
    link.votes.where(user_id: current_user.id).first
  end

  def up_vote
    update_vote(1)
    redirect_to :back
  end

  def down_vote
    update_vote(-1)
    redirect_to :back
  end

  private

    def update_vote(new_value)
      if vote
        vote.update_attribute(:value, new_value)
      else
        vote = current_user.votes.create(value: new_value,
                                  link: link, user: current_user)
      end
    end
end
