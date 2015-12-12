# == Schema Information
#
# Table name: comments
#
#  id              :integer          not null, primary key
#  conversation_id :integer
#  user_id         :integer
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true

  def user
    User.unscoped { super }
  end

  def send_notifications!
    users = conversation.users.uniq - [user]
    users.each do |user|
      NotificationMailer.comment_notification(user, self).deliver_later
    end
  end
end
