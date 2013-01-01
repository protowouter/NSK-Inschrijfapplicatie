class Entries::StepsController < ApplicationController
  include Wicked::Wizard
  load_and_authorize_resource
  
  steps :confirm_profile, :volunteer, :bankaccount, :confirm_entry
  
  def show
    @entry = Entry.find(params[:entry_id])
    case step
    when :confirm_profile
      @participant = @entry.participant
    end
    render_wizard
  end
end