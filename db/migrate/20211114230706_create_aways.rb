class CreateAways < ActiveRecord::Migration[6.1]
  def change
    create_table :aways do |t|
      t.references :tournament, null: false, foreign_key: true
      t.integer :tour
      t.datetime :match_date
      t.string :home_team
      t.string :result
      t.string :away_team

      t.timestamps
    end
  end
end
