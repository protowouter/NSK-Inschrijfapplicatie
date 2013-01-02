class Entries::StepsController < ApplicationController
  include Wicked::Wizard
  load_and_authorize_resource
  
  steps :confirm_profile, :volunteer, :events, :bankaccount, :confirm_entry
  
  def show
    @entry = Entry.find(params[:entry_id])
    case step
    when :confirm_profile
      @participant = @entry.participant
    when :events
      @events = @entry.meeting.events
    when :confirm_entry
      @event_participations = @entry.event_participations
    end
    render_wizard
  end
  
  def update
    @entry = Entry.find(params[:entry_id])
    case step
    when :volunteer, :bankaccount, :events
      @entry.update_attributes(params[:entry])
    end
    render_wizard @entry
  end
  
  def finish_wizard_path
    @entry = Entry.find(params[:entry_id])
    @entry.active = true
    @entry.save
    meetings_path
  end
end