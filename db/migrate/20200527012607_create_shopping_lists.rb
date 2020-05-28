class CreateShoppingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppinglists do |t|
      t.integer :cookbook_id
      t.integer :pantryitem_id
    end
  end
end
