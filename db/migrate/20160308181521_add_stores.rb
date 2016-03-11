class AddStores < ActiveRecord::Migration
 def change
    create_table :stores do |t|
      t.references :user
      t.string :stripeid
      t.string :access_token
      t.string :publish_token
      t.timestamps null: false
    end
  end
end
