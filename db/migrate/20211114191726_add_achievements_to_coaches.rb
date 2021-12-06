class AddAchievementsToCoaches < ActiveRecord::Migration[6.1]
  def change
    add_column :coaches, :achievements, :text
  end
end
