class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :club
      t.integer :points

      t.timestamps
    end
  end
end
