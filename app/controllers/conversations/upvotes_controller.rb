class Conversations::UpvotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def index
    @conversation = Conversations.all
  end


  def create
    @conversation.upvotes.where(user_id: current_user.id).first_or_create

    # (@conversation.users.uniq - [current_user]).each do |user|
    #     Notification.create(recipient: user, actor: current_user, action: "gave your conversation an", notifiable: @conversation.upvotes.last)
    #   end
    respond_to do |format|
      format.html {redirect_to @conversation}
      format.js
    end
  end

  def destroy
    @conversation.upvotes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html {redirect_to @conversation}
      format.js
    end
  end

  private

  def set_conversation
    @conversation = Conversation.friendly.find(params[:conversation_id])
  end
end