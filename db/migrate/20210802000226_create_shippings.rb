class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.references :order,            null: false, foreign_key: true
      t.string     :postal_code,      null: false
      t.integer    :region_id,        null: false
      t.string     :municipalities,   null: false
      t.string     :address,          null: false
      t.string     :building
      t.string     :telephone_number, null: false
      t.timestamps 
    end
  end
end
