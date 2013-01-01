class RemoveDinerFromEntries < ActiveRecord::Migration
  def up
    remove_column :entries, :diner
  end

  def down
    add_column :entries, :diner, :boolean
  end
end
