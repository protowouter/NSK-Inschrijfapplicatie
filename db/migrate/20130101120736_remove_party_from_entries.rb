class RemovePartyFromEntries < ActiveRecord::Migration
  def up
    remove_column :entries, :party
  end

  def down
    add_column :entries, :party, :boolean
  end
end
