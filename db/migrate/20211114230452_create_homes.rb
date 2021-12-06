class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|
      t.integer :tour
      t.string :match_date
      t.string :home_team
      t.string :result
      t.string :away_team

      t.timestamps
    end
  end
end
