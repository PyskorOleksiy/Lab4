class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|
      t.string :name
      t.date :contract_until
      t.integer :age
      t.date :appointed
      t.string :preferred_formation
      t.float :avrg_coach_term
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
