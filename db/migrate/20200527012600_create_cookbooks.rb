class CreateCookbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cookbooks |t|
      t.integer :user_id
    end
  end
end
