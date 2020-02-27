class AddUidToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :uid, :string
    add_column :artists, :login, :string
    add_column :artists, :token, :string
  end
end
