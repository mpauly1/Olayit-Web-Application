class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.date :saledate
      t.text :salenotes

      t.timestamps null: false
    end
  end
end
