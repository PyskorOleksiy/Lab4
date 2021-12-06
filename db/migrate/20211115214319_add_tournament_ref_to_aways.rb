class AddTournamentRefToAways < ActiveRecord::Migration[6.1]
  def change
    add_reference :aways, :tournament, foreign_key: true
  end
end
