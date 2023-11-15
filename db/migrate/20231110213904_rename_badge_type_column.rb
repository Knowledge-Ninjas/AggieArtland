class RenameBadgeTypeColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :badges, :type, :badge_type
  end
end
