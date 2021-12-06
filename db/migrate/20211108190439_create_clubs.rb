class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :stadium
      t.float :total_market_value
      t.integer :tournament_position
      t.float :average_age
      t.integer :titles
      t.string :country

      t.timestamps
    end
  end
end
