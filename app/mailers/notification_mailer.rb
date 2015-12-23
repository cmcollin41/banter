class NotificationMailer < ActionMailer::Base
  default from: "notifications@sportsbanter.co"

  def comment_notification(user, comment)
    @user = user
    @comment = comment

    mail(
      to: "#{user.email}",
      subject: "[Banter] New comment in #{comment.conversation.subject}"
    )
  end
end
