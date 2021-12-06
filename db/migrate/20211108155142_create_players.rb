class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :number
      t.integer :age
      t.string :country
      t.date :contract_until
      t.references :club, null: false, foreign_key: true


      t.timestamps
    end
  end
end
