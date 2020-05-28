class CreateUseItOrLoseIts < ActiveRecord::Migration[5.2]
  def change
    create_table :useitorloseits do |t|
      t.integer :pantryitem_id
      t.string :ingredient
    end
  end
end
