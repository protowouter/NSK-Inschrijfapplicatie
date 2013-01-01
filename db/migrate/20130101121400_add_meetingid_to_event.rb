class AddMeetingidToEvent < ActiveRecord::Migration
  def change
    add_column :events, :meeting_id, :integer
  end
end
