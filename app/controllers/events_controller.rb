class EventsController < ApplicationController
  load_and_authorize_resource
  def index
    @events = Event.includes(:event_participations, :sex, {:entries => :club}).all
  end
end

