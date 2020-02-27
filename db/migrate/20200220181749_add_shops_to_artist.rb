class AddShopsToArtist < ActiveRecord::Migration[5.2]
  def change
    add_reference :artists, :shop, foreign_key: true
  end
end
