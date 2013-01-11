class AddStatusToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :status, :string
  end
end
