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

class Commitment < ActiveRecord::Base
  belongs_to :user
  belongs_to :school, :counter_cache => true
end
