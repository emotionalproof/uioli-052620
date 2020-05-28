class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :useitorloseit_id
      t.string :ingredients
    end
  end
end
