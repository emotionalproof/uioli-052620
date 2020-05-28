class CreateCookbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cookbooks do |t|
      t.integer :user_id
      t.string :name
      t.integer :website_id
    end
  end
end
