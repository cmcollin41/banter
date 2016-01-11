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
#  favorites_count :integer          default(0), not null
#

class Comment < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :body, presence: true
  after_create :notify_users

  def user
    User.unscoped { super }
  end

  def notify_users
    mentioned_users.each do |user|
      NotificationMailer.comment_notification(user, self).deliver_later
    end
  end

  def mentions
    @mentions ||= begin
      regex = /@([\w]+)/
      matches = body.scan(regex).flatten
    end
  end

  def mentioned_users
    @mentioned_users ||= User.where(username: mentions)
  end

  def favorite_count
    self.favorites.count
  end
end
