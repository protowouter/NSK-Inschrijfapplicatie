class RemoveAdminFromParticipants < ActiveRecord::Migration
  def up
    remove_column :participants, :admin
  end

  def down
    add_column :participants, :admin, :boolean
  end
end
