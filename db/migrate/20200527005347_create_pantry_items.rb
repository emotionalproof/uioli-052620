class CreatePantryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :pantryitems do |t|
      t.integer :user_id
      t.string :ingredients
    end 
  end
end
