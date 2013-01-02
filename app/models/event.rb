# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  sex_id      :integer
#  time_format :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  meeting_id  :integer
#

class Event < ActiveRecord::Base
  belongs_to :sex
  belongs_to :meeting
  has_many :event_participations, :dependent => :destroy, :order => 'best_performance'
  has_many :entries, :through => :event_participations
  
  validates_presence_of :sex_id
end
