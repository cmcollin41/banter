# == Schema Information
#
# Table name: answers
#
#  id              :integer          not null, primary key
#  answer_one      :string
#  conversation_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  answer_two      :string
#

class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation, :counter_cache => true
end
