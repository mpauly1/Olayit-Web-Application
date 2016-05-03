class AddProdqtyToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :prodqty, :integer
  end
end
