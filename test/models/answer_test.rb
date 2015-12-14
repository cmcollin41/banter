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

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
