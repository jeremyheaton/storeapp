class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :product
      t.integer :price
      t.text :description

      t.timestamps null: false
    end
  end
end
