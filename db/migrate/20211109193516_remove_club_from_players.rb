class RemoveClubFromPlayers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :players, :club, null: false, foreign_key: true
  end
end
