class ConversationMailer < ActionMailer::Base
  default from: "notifications@sportsbanter.co"

  def comment_notification(user, comment)
    @user = user
    @comment = comment

    mail(
      to: "#{user.email}",
      subject: "[Banter] #{comment.user.name} commented in '#{comment.conversation.subject}' conversation"
    )
  end
end