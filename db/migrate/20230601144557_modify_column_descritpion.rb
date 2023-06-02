class ModifyColumnDescritpion < ActiveRecord::Migration[7.0]
  def change
    remove_column :spaceships, :descritpion, :text
    add_column :spaceships, :description, :text
  end
end
