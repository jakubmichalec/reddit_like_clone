class CommentsController < ApplicationController

  expose(:link)
  expose(:comment)

  def create
    comment = link.comments.build(comment_params)
    comment.user_id = current_user.id
    comment.author = current_user.name
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
