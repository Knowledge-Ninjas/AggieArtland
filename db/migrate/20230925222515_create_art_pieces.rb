class CreateArtPieces < ActiveRecord::Migration[7.0]
  def change
    create_table :art_pieces do |t|
      t.string :name
      t.text :description 
      t.string :address      
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :art_pieces, :latitude
    add_index :art_pieces, :longitude
  end
end
