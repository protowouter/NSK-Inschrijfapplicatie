class Entries::StepsController < ApplicationController
  include Wicked::Wizard
  load_and_authorize_resource
  
  steps :confirm_profile, :volunteer, :events, :bankaccount, :confirm_entry
  
  def show
    @entry = Entry.find(params[:entry_id])
    @participant = @entry.participant
    @events = @entry.meeting.events
    @event_participations = @entry.event_participations

    render_wizard
  end
  
  def update
    @entry = Entry.find(params[:entry_id])
    params[:entry] ||= {}
    params[:entry][:status] = step.to_s
    params[:entry][:status] = 'active' if step == steps.last
    @entry.update_attributes(params[:entry])
    
    @participant = @entry.participant
    @events = @entry.meeting.events
    @event_participations = @entry.event_participations
    
    render_wizard @entry
  end
  
  def finish_wizard_path
    meetings_path
  end
end