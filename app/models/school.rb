# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
# Indexes
#
#  index_schools_on_slug  (slug) UNIQUE
#

class School < ActiveRecord::Base

  has_many :conversations, dependent: :destroy
end
