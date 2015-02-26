class AddActiveToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :active, :boolean
  end
end
