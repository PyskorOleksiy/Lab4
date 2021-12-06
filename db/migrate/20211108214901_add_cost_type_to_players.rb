class AddCostTypeToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :cost_type, :string
  end
end
