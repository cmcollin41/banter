# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  first_name             :string
#  last_name              :string
#  created_at             :datetime
#  updated_at             :datetime
#  deleted_at             :datetime
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#  admin                  :boolean          default(FALSE)
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  username               :string
#
# Indexes
#
#  index_users_on_deleted_at            (deleted_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_invitation_token      (invitation_token) UNIQUE
#  index_users_on_invitations_count     (invitations_count)
#  index_users_on_invited_by_id         (invited_by_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#", icon: "50x50#", nav: "25x25#" }, default_url: "b_logo.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :notifications, foreign_key: :recipient_id
  has_many :conversations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :polls, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :commitments, dependent: :destroy
  has_many :invitations, :class_name => 'User', :as => :invited_by

  def upvotes?(conversation)
    conversation.upvotes.where(user_id: id).any?
  end

  def favorites?(comment)
    comment.favorites.where(user_id: id).any?
  end

  def committed?
    self.commitments.any?
  end

  def commitments?(school)
    school.commitments.where(user_id: id).any?
  end

  def answers?(conversation)
    conversation.answers.where(user_id: id).any?
  end

  def avatar_url
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end


  def name
    if deleted_at?
      "Deleted User"
    else
      "#{first_name} #{last_name}"
    end
  end
end
