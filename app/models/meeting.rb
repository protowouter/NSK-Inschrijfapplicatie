# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Meeting < ActiveRecord::Base
  has_many :events
end
