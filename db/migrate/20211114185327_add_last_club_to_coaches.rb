class AddLastClubToCoaches < ActiveRecord::Migration[6.1]
  def change
    add_column :coaches, :last_club, :string
  end
end
