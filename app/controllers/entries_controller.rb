class EntriesController < ApplicationController
  load_and_authorize_resource
  
  def new
    if !params[:meeting_id]
      redirect_to meetings_path
    elsif current_participant
      entry = Entry.new
      entry.meeting = Meeting.find(params[:meeting_id])
      entry.participant = current_participant
      if entry.save
        redirect_to entry_step_path(:confirm_profile, :entry_id => entry.id)
      else
        flash[:notice] = "Je hebt je al ingeschreven voor deze wedstrijd"
        redirect_to meetings_path
      end
    else
      redirect_to login_path
    end
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
      def participant_current_participant?
        @entry = Entry.find(params[:id])
        if current_participant != @entry.participant
          redirect_to root_path
        end
      end
      
      
      def get_facebook_token
        client = OAuth2::Client.new(Settings.facebook_appid, Settings.facebook_appsecret, :site => 'https://graph.facebook.com')
        token = OAuth2::AccessToken.new(client, session['fb_access_token'])
        
        return token
      end
         
end
