class AddClubRefToCoaches < ActiveRecord::Migration[6.1]
  def change
    add_reference :coaches, :club, foreign_key: true
  end
end
