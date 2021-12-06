class RemoveMatchDateFromAways < ActiveRecord::Migration[6.1]
  def change
    remove_column :aways, :match_date, :datetime
  end
end
