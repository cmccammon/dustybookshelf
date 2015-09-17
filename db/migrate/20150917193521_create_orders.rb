class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :item_id
      t.string :user_id
      t.string :quantity, null: false

      t.timestamps null: false
    end
  end
end
