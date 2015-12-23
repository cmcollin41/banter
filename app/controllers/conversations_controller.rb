class ConversationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_conversation, except: [:index, :new, :create]
  before_action :set_school, only: [:index, :new, :create, :edit]
  before_action :set_schools
 
  def index
    # @q = Conversation.search(params[:q])
    # @conversations = @q.result(distinct: true).order(likes_count: :desc)
    @conversations = @school.conversations.all
  end

  def show
    @comment = Comment.new
    @answer = Answer.new
    @poll = @conversation.polls.find_by(params[:conversation_id])
    @comments = @conversation.comments.order(created_at: :asc);
  end

  def new
    @conversation = @school.conversations.new
    @conversation.comments.new
    @conversation.polls.new
    @conversation.answers.new
  end

  def create
    @conversation = @school.conversations.new conversation_params
    @conversation.user_id = current_user.id
    @conversation.comments.first.user_id = current_user.id
    @conversation.polls.first.user_id = current_user.id

    if @conversation.save
      redirect_to school_path(@school)
    else
      render action: :new
    end
  end

  def destroy
    @conversation = Conversation.friendly.find(params[:id])
    @conversation.destroy
    redirect_to root_path
  end

  private

    def set_conversation
      @conversation = Conversation.friendly.find(params[:id])
    end

    def set_school
      @school = School.friendly.find(params[:school_id])
    end

    def set_schools
      @schools = School.all
    end


    def conversation_params
      params.require(:conversation).permit(:subject, :school_id, comments_attributes: [:body], polls_attributes: [:option_a, :option_b], answers_attributes: [:answer_one, :answer_two])
    end
end
