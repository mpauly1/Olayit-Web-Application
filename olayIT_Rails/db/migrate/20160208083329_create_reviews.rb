class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :squad_id
      t.date :reviewdate
      t.text :comments
      t.integer :rating
      t.string :status

      t.timestamps null: false
    end
  end
end
