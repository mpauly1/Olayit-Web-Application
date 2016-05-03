class AddDetailsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :squad_id, :integer
    add_column :orders, :squadname, :string
  end
end
