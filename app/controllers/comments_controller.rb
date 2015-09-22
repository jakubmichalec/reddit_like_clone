class CommentsController < ApplicationController

  expose(:link)
  expose(:comment)

  def create
    comment = link.comments.build(comment_params)

    if comment.save
      flash[:notice] = "Comment has been added"
      redirect_to link
    else
        render 'new'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :body, :link_id, :user_id)
    end
end
