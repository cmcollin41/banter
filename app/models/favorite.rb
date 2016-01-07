# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :integer
#  user_id    :integer
#

class Favorite < ActiveRecord::Base
  belongs_to :comment, :counter_cache => true
end
