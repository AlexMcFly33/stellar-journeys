class AddDescriptionToSpaceships < ActiveRecord::Migration[7.0]
  def change
    add_column :spaceships, :descritpion, :text
  end
end
