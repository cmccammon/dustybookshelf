class AddQuantityToOrders < ActiveRecord::Migration
  def change
    change_column :orders, :quantity, 'integer USING CAST(quantity AS integer)'
  end
end

