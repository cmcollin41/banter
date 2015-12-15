# == Schema Information
#
# Table name: polls
#
#  id              :integer          not null, primary key
#  conversation_id :integer
#  user_id         :integer
#  option_a        :string           not null
#  option_b        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class PollTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
