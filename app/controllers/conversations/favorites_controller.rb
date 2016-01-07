class Conversations::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment


  def create
    @comment.favorites.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html {redirect_to request.referer}
      format.js
    end
  end

  def destroy
    @comment.favorites.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html {redirect_to request.referer}
      format.js
    end
  end

  private

  def set_comment
    #@conversation = Conversation.find(params[:id])
    @comment = Comment.find(params[:comment_id])
  end

end