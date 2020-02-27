class RemoveTattooStylesFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :tattoo_styles, :string
  end
end
