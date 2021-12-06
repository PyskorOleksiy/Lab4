class RemoveClubIdFromPlayers < ActiveRecord::Migration[6.1]
  def change
    remove_column :players, :club_id, :integer
  end
end
