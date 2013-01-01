class AddStatusToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :status, :boolean
  end
end
