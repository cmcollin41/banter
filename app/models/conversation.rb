# == Schema Information
#
# Table name: conversations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  subject     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#  slug        :string
#  likes_count :integer          default(0), not null
#
# Indexes
#
#  index_conversations_on_deleted_at  (deleted_at)
#  index_conversations_on_slug        (slug) UNIQUE
#

class Conversation < ActiveRecord::Base
  extend FriendlyId
  friendly_id :subject, use: :slugged
  acts_as_paranoid

  belongs_to :user
  has_many :comments
  has_many :polls
  has_many :likes
  has_many :users, through: :comments
  has_many :users, through: :polls

  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :polls

  validates :subject, presence: true
  validates_associated :comments
  validates_associated :polls


  def post_count
    self.comments.count
  end

  def like_count
    self.likes.count
  end
end
