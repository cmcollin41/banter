class NotificationMailer < ActionMailer::Base
  default from: "notifications@sportsbanter.co"

  def comment_notification(user, comment)
    @user = user
    @comment = comment

    mail(
      to: "#{user.email}",
      subject: "[Banter] #{comment.user.name} mentioned you in '#{comment.conversation.subject}' conversation"
    )
  end
end
