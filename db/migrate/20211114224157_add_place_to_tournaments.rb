class AddPlaceToTournaments < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :place, :integer
  end
end
