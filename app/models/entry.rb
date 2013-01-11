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
#  status            :string(255)
#

class Entry < ActiveRecord::Base
  has_many :event_participations, :dependent => :destroy
  has_many :events, :through => :event_participations
  has_many :volunteer_days, :dependent => :destroy
  has_many :days, :through => :volunteer_days
  
  belongs_to :participant
  belongs_to :meeting
  
  accepts_nested_attributes_for :event_participations
  validates_associated :event_participations
  
  validates_uniqueness_of :meeting_id , :scope => :participant_id
  validates_presence_of :banknumber, :bankAccountName, :bankLocation, :bankAuthorization, :if => :active_or_bankaccount?
  
  attr_accessible :banknumber, :bankLocation, :bankAuthorization, :bankAccountName, :event_participations_attributes, :status
  
  def active?
    status == 'active'
  end
  
  def active_or_bankaccount?
    status && status.include?('bankaccount') || active?
  end
  
  
    
end
