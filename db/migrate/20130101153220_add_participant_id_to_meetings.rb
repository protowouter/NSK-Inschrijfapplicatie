class AddParticipantIdToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :participant_id, :integer
  end
end
