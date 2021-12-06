class RemoveMarketValueSumFromPlayers < ActiveRecord::Migration[6.1]
  def change
    remove_column :players, :market_value_sum, :float
  end
end
