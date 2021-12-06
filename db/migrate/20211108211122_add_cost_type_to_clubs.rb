class AddCostTypeToClubs < ActiveRecord::Migration[6.1]
  def change
    add_column :clubs, :cost_type, :string
  end
end
