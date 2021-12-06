class AddCountryToCoaches < ActiveRecord::Migration[6.1]
  def change
    add_column :coaches, :country, :string
  end
end
