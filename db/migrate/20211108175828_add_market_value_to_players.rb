class AddMarketValueToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :market_value, :float
  end
end
