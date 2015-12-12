class Conversations::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def index
    @conversation = Conversations.all
  end


  def create
    @conversation.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html {redirect_to @conversation}
      format.js
    end
  end

  def destroy
    @conversation.likes.where(user_id: current_user.id).destroy_all

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