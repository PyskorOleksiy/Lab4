class AddMatchDateToHomes < ActiveRecord::Migration[6.1]
  def change
    add_column :homes, :match_date, :datetime
  end
end
