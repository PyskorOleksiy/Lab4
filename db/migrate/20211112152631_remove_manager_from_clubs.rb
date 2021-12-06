class RemoveManagerFromClubs < ActiveRecord::Migration[6.1]
  def change
    remove_column :clubs, :manager, :integer
  end
end
