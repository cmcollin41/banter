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
#  sort              :string
#
# Indexes
#
#  index_schools_on_conversation_id  (conversation_id)
#  index_schools_on_slug             (slug) UNIQUE
#

require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
