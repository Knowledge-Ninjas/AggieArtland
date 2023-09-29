class ModifyConstraintsOfColumnsArtPieces < ActiveRecord::Migration[7.0]
  def change
      change_column_null :art_pieces, :name, null: false, unique: true
      change_column_null :art_pieces, :address, null: false
  end
end
