class VolunteerDay < ActiveRecord::Base
  belongs_to :day
  belongs_to :entry
end
# == Schema Information
#
# Table name: volunteer_days
#
#  id              :integer         not null, primary key
#  day_id          :integer
#  entry_id :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

