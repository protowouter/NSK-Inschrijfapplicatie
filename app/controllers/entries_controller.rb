class EntriesController < ApplicationController
  load_and_authorize_resource
  
  def new
    if !params[:meeting_id]
      redirect_to meetings_path
    elsif current_participant
      entry = Entry.new
      meeting = Meeting.find(params[:meeting_id])
      entry.meeting = meeting
      entry.participant = current_participant
      if entry.save
        redirect_to entry_step_path(:confirm_profile, :entry_id => entry.id)
      else
        redirect_to meetings_path
      end
    else
      redirect_to login_path
    end
  end
  
  def index
    @entries = current_participant.entries
  end
  
  def edit
    entry = Entry.find(params[:id])
    redirect_to entry_step_path(:confirm_profile, :entry_id => entry.id)
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy
    flash[:success] = "Inschrijving verwijderd"
      redirect_to entries_path
  end
  
  private
    def get_facebook_token
      client = OAuth2::Client.new(Settings.facebook_appid, Settings.facebook_appsecret, :site => 'https://graph.facebook.com')
      token = OAuth2::AccessToken.new(client, session['fb_access_token'])
      
      token
    end
end
