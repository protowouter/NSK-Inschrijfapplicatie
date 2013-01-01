class AddInfoToParticipant < ActiveRecord::Migration
  def change
    change_table :participants do |t|
      t.references  :sex
      t.references  :club
      t.references  :college
      t.date        :birthdate
      t.string      :study
      t.string      :licensenumber
    end
  end
end
