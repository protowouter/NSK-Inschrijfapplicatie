class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    meeting = Meeting.new(params[:meeting])
    if meeting.save
      redirect_to meetings_path
    else
      render 'new'
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    meeting = Meeting.find(params[:id])
    if meeting.update_attributes(params[:meeting])
      redirect_to meetings_path
    else
      render 'edit'
    end
  end

  def destroy
    meeting = Meeting.find(params[:id])
    meting.destroy
    redirect_to meetings_path
  end
end
