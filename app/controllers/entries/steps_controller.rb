class Entries::StepsController < ApplicationController
  include Wicked::Wizard
  load_and_authorize_resource
  
  steps :confirm_profile, :volunteer, :bankaccount, :confirm_entry
  
  def show
    @entry = Entry.find(params[:entry_id])
    render_wizard
  end
end