# == Schema Information
#
# Table name: entries
#
#  id                :integer          not null, primary key
#  participant_id    :integer
#  banknumber        :string(255)
#  bankAccountName   :string(255)
#  bankLocation      :string(255)
#  bankAuthorization :boolean
#  auth_hash         :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  meeting_id        :integer
#  status            :boolean
#

class Entry < ActiveRecord::Base
  belongs_to :participant
  belongs_to :meeting
  has_many :event_participations, :dependent => :destroy
  has_many :events, :through => :event_participations
  has_many :volunteer_days, :dependent => :destroy
  has_many :days, :through => :volunteer_days
  accepts_nested_attributes_for :event_participations
  validates_associated :event_participations
    
end
