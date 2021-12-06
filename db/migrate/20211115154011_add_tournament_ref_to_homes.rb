class AddTournamentRefToHomes < ActiveRecord::Migration[6.1]
  def change
    add_reference :homes, :tournament, foreign_key: true
  end
end
