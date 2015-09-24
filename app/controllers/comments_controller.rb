class CommentsController < ApplicationController

  expose(:link)
  expose(:comment)
  expose(:comments) { Comment.includes(:user, link: :link)}

  def create
    comment = link.comments.build(comment_params)
    #comment.user = current_user

    if comment.save
      respond_to do |format|
        format.html { redirect_to link, notice: "Comment has been added" }
        format.js
      end
    else
        render 'new'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :link_id, :user_id)
    end
end
