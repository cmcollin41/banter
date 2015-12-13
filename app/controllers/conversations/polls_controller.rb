class Conversations::PollsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def create
    @poll = @conversation.polls.new poll_params
    @poll.user = current_user

    if @poll.save
      @poll send_notifications!
      redirect_to conversation_path(@conversation), notice: "Successfully posted!"
    else
      redirect_to @conversation, alert: "Unable to save your poll"
    end
  end

  private

    def set_conversation
      @conversation = Conversation.friendly.find(params[:conversation_id])
    end

    def poll_params
      params.require(:poll).permit(:option_a, :option_b)
    end
end