class RemoveCostTypeFromClubs < ActiveRecord::Migration[6.1]
  def change
    remove_column :clubs, :cost_type, :boolean
  end
end
