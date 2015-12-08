# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  slug       :string
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
  has_many :users, through: :comments

  accepts_nested_attributes_for :comments

  validates :subject, presence: true
  validates_associated :comments


  def post_count
    self.comments.count
  end
end
