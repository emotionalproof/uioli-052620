class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients |t|
      t.string :name
      t.integer :recipe_id
      # t.integer :api_id
    end
  end
end
