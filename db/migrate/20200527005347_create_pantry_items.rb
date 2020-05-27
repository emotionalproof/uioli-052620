class CreatePantryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :pantryitems |t|
      i.integer :user_id
      t.string :ingredients
      t.string :uioli, default: nil
    end 
  end
end
