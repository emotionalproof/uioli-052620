class DropCreateShoppingListsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :shoppinglists
  end
end
