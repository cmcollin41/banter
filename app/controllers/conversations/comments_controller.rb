class Conversations::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def create
    @comment = @conversation.comments.new comment_params
    @comment.user = current_user

    if @comment.save
      @comment.send_notifications!
      redirect_to conversation_path(@conversation, anchor: "comment_#{@comment.id}"), notice: "Successfully posted!"
    else
      redirect_to @conversation, alert: "Unable to save your comment"
    end
  end

  def destroy
    @conversation = Conversation.friendly.find(params[:conversation_id])
    @comment = @conversation.comments.find(params[:id])
    @comment.destroy
    redirect_to @conversation
  end

  private

    def set_conversation
      @conversation = Conversation.friendly.find(params[:conversation_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
