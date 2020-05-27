class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes |t|
      t.string :name
      t.integer :api_id
      t.integer :cookbook_id, default: nil
    end
  end
end
