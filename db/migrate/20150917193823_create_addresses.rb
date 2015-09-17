class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :user_id
      t.string :street_name
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
