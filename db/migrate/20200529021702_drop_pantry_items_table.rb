class DropPantryItemsTable < ActiveRecord::Migration[5.2]
  def change
      drop_table :pantryitems do |t|
        t.integer :user_id
        t.string :ingredients
      end
  end
end
