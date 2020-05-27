class CreateUseItOrLoseIts < ActiveRecord::Migration[5.2]
  def change
    create_table :useitorloseits |t|
      t.integer :pantryitem_id
      t.string :ingredients
    end
  end
end
