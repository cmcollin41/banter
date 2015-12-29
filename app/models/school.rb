# == Schema Information
#
# Table name: schools
#
#  id                :integer          not null, primary key
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string
#  school_id         :integer
#  conversation_id   :integer
#  commitments_count :integer          default(0), not null
#
# Indexes
#
#  index_schools_on_conversation_id  (conversation_id)
#  index_schools_on_slug             (slug) UNIQUE
#

class School < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :conversations, dependent: :destroy
  has_many :commitments, dependent: :destroy


  # def self.recent_convos
  #   School.conversations.where("created_at >= ?", 1.day.ago.utc).order("likes_count DESC, created_at DESC")
  # end

  # def self.past_convos
  #   School.conversations.where("created_at < ?", 1..ago.utc).order("likes_count DESC, created_at DESC")
  # end
end
