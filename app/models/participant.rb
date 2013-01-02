# == Schema Information
#
# Table name: participants
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)      default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  sex_id                 :integer
#  club_id                :integer
#  college_id             :integer
#  birthdate              :date
#  study                  :string(255)
#  licensenumber          :string(255)
#

class Participant < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  has_many :meetings, :through => :entries
  has_many :authentications, :dependent => :destroy
  belongs_to :sex
  belongs_to :club
  belongs_to :college
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :sex_id, :club_id, :college_id, :birthdate, :study, :licensenumber
  
  validates_presence_of :name, :sex_id, :club_id, :college_id
  
  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  

  def facebook(access_token)
    @fb_user ||= FbGraph::User.me(access_token)
  end
  
  def publish(text, feed_name, token)

    facebook(token).feed!(:message => text, :name => feed_name)


    #rescue Exception => e
  end

end
