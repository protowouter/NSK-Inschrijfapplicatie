class AddMeetingIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :meeting_id, :integer
  end
end
