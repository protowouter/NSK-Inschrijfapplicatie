class ChangeStatusFromEntriesToActive < ActiveRecord::Migration
  def change
    rename_column :entries, :status, :active
  end
end
