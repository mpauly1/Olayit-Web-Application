class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
      t.string :squadname
      t.string :squadimage
      t.text :description
      t.integer :category_id
      t.float :saleprice
      t.string :status
      t.float :purchaseprice
      t.integer :qtyonhand
      t.integer :reorderpoint
      t.integer :reorderqty

      t.timestamps null: false
    end
  end
end
