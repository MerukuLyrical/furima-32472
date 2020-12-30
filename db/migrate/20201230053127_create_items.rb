class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                null: false
      t.text :explaining,             null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :delivary_fee_id,     null: false
      t.integer :area_id,             null: false
      t.integer :need_day_id,         null: false
      t.integer :price,               null:false
      t.references :user,              foreign_key: true
      t.timestamps
    end
  end
end
