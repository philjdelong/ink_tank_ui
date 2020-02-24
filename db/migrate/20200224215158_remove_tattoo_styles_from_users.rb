class RemoveTattooStylesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :tattoo_styles, :string
  end
end
