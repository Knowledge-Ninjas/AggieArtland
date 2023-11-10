class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :requirement

      t.timestamps
    end
  end
end
