class AddBadgesStampsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :badges, :integer
    add_column :users, :stamps, :integer
  end
end
