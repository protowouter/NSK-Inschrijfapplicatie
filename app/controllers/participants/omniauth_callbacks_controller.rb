class Participants::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @participant = Participant.find_for_facebook_oauth(request.env["omniauth.auth"], current_participant)
      session["fb_access_token"] = request.env["omniauth.auth"]["credentials"]["token"]
      if @participant.persisted?
        sign_in_and_redirect @participant, :event => :authentication #this will throw if @participant is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_participant_registration_url
      end
    end
end