class AddMatchDateToAways < ActiveRecord::Migration[6.1]
  def change
    add_column :aways, :match_date, :datetime
  end
end
