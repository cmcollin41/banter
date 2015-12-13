# == Schema Information
#
# Table name: polls
#
#  id              :integer          not null, primary key
#  conversation_id :integer
#  user_id         :integer
#  option_a        :string
#  option_b        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Poll < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
end
