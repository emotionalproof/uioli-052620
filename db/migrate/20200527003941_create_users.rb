class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users |t|
      t.string :username
    end
  end
end
