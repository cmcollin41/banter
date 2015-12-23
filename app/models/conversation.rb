# == Schema Information
#
# Table name: conversations
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  subject       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  deleted_at    :datetime
#  slug          :string
#  likes_count   :integer          default(0), not null
#  answers_count :integer          default(0), not null
#  school_id     :integer
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
  belongs_to :school
  has_many :comments, dependent: :destroy
  has_many :polls, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :comments, dependent: :destroy
  has_many :users, through: :likes, dependent: :destroy
  has_many :users, through: :polls, dependent: :destroy
  has_many :users, through: :answers, dependent: :destroy


  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :polls
  accepts_nested_attributes_for :answers

  validates :subject, presence: true
  validates_associated :comments
  validates_associated :polls
  validates_associated :answers


  def post_count
    self.comments.count
  end

  def like_count
    self.likes.count
  end

  def answer_one
    self.answers.count(:answer_one)
  end

  def answer_two
    self.answers.count(:answer_two)
  end

  # def self.recent_convos
  #   Conversation.where("created_at >= ?", 1.day.ago.utc).order("likes_count DESC, created_at DESC")
  # end

  # def self.past_convos
  #   Conversation.where("created_at < ?", 1..ago.utc).order("likes_count DESC, created_at DESC")
  # end

end
