class RemoveCoachIdFromClubs < ActiveRecord::Migration[6.1]
  def change
    remove_column :clubs, :coach_id, :integer
  end
end
