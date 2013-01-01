class RemoveExcessFromEntries < ActiveRecord::Migration
  def up
    remove_column :entries, :name
    remove_column :entries, :birthdate
    remove_column :entries, :sex_id
    remove_column :entries, :club_id
    remove_column :entries, :licensenumber
    remove_column :entries, :college_id
    remove_column :entries, :studentnumber
    remove_column :entries, :meetRegulations
    remove_column :entries, :zeusDatabase
    remove_column :entries, :shirtsize
    remove_column :entries, :volunteerPreferences
    remove_column :entries, :study
  end

  def down
    add_column :entries, :study, :string
    add_column :entries, :volunteerPreferences, :string
    add_column :entries, :shirtsize, :string
    add_column :entries, :zeusDatabase, :boolean
    add_column :entries, :meetRegulations, :boolean
    add_column :entries, :studentnumber, :string
    add_column :entries, :college_id, :integer
    add_column :entries, :licensenumber, :string
    add_column :entries, :club_id, :integer
    add_column :entries, :sex_id, :integer
    add_column :entries, :birthdate, :date
    add_column :entries, :name, :string
  end
end
