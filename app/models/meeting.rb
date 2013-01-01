# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date       :date
#  name       :string(255)
#

class Meeting < ActiveRecord::Base
  has_many :events, :dependent => :destroy
  has_many :participants, :through => :events
  belongs_to :participant
end
