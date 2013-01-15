# == Schema Information
#
# Table name: meetings
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  date           :date
#  name           :string(255)
#  participant_id :integer
#

class Meeting < ActiveRecord::Base
  has_many :events, :dependent => :destroy
  has_many :entries, :dependent => :destroy
  has_many :participants, :through => :entries
  belongs_to :participant
  accepts_nested_attributes_for :events, :allow_destroy => :true
  validates_associated :events
  
  validates_presence_of :name, :date
end
