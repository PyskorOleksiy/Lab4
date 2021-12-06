class RemoveMatchDateFromHomes < ActiveRecord::Migration[6.1]
  def change
    remove_column :homes, :match_date, :datetime
  end
end
