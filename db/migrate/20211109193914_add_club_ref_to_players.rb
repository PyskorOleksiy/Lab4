class AddClubRefToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_reference :players, :club, null: false, foreign_key: true
  end
end
