class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|

      t.string :name
      t.string :description
      t.time :duration
      t.text :prepare
      t.integer :rating

      t.timestamps
    end
  end
end
