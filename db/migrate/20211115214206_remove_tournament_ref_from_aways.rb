class RemoveTournamentRefFromAways < ActiveRecord::Migration[6.1]
  def change
    remove_reference :aways, :tournament, null: false, foreign_key: true
  end
end
