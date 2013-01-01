class AddDateAndNameToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :date, :date
    add_column :meetings, :name, :string
  end
end
