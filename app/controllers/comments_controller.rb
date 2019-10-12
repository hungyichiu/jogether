class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.event_id = params[:event_id]

    @comment.save
    
    redirect_to event_path(@comment.event)
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
  
end
