class RemoveTournamentRefFromHomes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :homes, :tournament, null: false, foreign_key: true
  end
end
