class CreateShoppingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppinglists |t|
      t.integer :cookbook_id
      t.integer :pantryitem_id
      #t.integer :recipe_id  Does this list select recipes from the cookbook
      #Or does it assume all cookbook recipes are on the shopping list?
    end
  end
end
