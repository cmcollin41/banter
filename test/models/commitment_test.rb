# == Schema Information
#
# Table name: commitments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CommitmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
