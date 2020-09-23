class AlterColumnEmployeesBadgeId < ActiveRecord::Migration[6.0]
  def change
    add_index :employees, :badge_id, unique: true
  end
end
