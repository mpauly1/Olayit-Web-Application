class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :phoneNumber
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.text :additionalNotes

      t.timestamps null: false
    end
  end
end
