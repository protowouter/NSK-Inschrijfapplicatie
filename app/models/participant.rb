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
#  provider               :string(255)
#  uid                    :string(255)
#

class Participant < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  has_many :meetings, :through => :entries
  belongs_to :sex
  belongs_to :club
  belongs_to :college
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :name, :sex_id, :club_id, 
                  :college_id, :birthdate, :study, :licensenumber,
                  :provider, :uid

  validates_presence_of :name, :sex_id, :club_id, :college_id
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    participant = Participant.where(:provider => auth.provider, :uid => auth.uid).first
    unless participant
      participant = Participant.new
    end
    participant
  end
  
  def self.new_with_session(params, session)
      super.tap do |participant|
        if data = session["devise.facebook_data"]
          participant.provider = session["devise.facebook_data"]["provider"] if participant.provider.blank?
          participant.uid = session["devise.facebook_data"]["uid"] if participant.uid.blank?
          participant.name = data["name"] if participant.name.blank?
          if session["devise.facebook_data"]["extra"]["raw_info"]
            participant.email = data["email"] if participant.email.blank?
          end   
        end
        
      end
    end
    
  def post_to_wall(token)
    me = FbGraph::User.me(token)
    me.feed!(
      :message => 'Updating via FbGraph',
      :picture => 'https://graph.facebook.com/matake/picture',
      :link => 'https://github.com/nov/fb_graph',
      :name => 'FbGraph',
      :description => 'A Ruby wrapper for Facebook Graph API'
    )
  end


end
