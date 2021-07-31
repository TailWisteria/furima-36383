class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user,               null: false, foreign_key: true
      t.string      :name,               null: false
      t.text        :detail,             null: false
      t.integer     :category_id,        null: false
      t.integer     :condition_id,       null: false
      t.integer     :shipping_charge_id, null: false
      t.integer     :required_day_id,    null: false
      t.integer     :region_id,          null: false
      t.integer     :price,              null: false
      t.timestamps
    end
  end
end
