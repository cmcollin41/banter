class NotificationMailer < ActionMailer::Base
  default from: "notifications@banter.com"

  def comment_notification(user, comment)
    @user = user
    @comment = comment

    mail(
      to: "#{user.email}",
      subject: "[Banter] New post in #{comment.conversation.subject}"
    )
  end
end
