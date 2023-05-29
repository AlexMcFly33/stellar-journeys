class CreateSpaceships < ActiveRecord::Migration[7.0]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.integer :superficy
      t.boolean :gravity
      t.string :localisation
      t.integer :number_of_guest
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
