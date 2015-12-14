class Conversations::AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def index
    @conversation = Conversations.all
  end

  def create
    @answer = @conversation.answers.new answer_params
    @answer.user = current_user

    if @answer.save
      redirect_to conversation_path(@conversation), notice: "Successfully Answered!"
    else

      redirect_to @conversation, alert: "Unable to save your response"
    end
  end

  private

  def set_conversation
    @conversation = Conversation.friendly.find(params[:conversation_id])
  end

  def answer_params
    params.require(:answer).permit(:answer_one, :answer_two)
  end
end