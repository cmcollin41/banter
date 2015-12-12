class ConversationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_conversation, except: [:index, :new, :create]

  def index
    @q = Conversation.search(params[:q])
    @conversations = @q.result(distinct: true).order(likes_count: :desc)
  end

  def show
    @comment = Comment.new

  end

  def new
    @conversation = Conversation.new
    @conversation.comments.new
  end

  def create
    @conversation = current_user.conversations.new conversation_params
    @conversation.comments.first.user_id = current_user.id

    if @conversation.save
      redirect_to @conversation
    else
      render action: :new
    end
  end

  private

    def set_conversation
      @conversation = Conversation.friendly.find(params[:id])
    end

    def conversation_params
      params.require(:conversation).permit(:subject, comments_attributes: [:body])
    end
end
