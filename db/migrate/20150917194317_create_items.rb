class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :price, default: 0
      t.string :description

      t.timestamps null: false
    end
  end
end
