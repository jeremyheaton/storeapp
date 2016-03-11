class AddStoreToItem < ActiveRecord::Migration
  def change
    add_reference :items, :user, index: true, foreign_key: true
    add_reference :items, :store, index: true, foreign_key: true
  end
end
