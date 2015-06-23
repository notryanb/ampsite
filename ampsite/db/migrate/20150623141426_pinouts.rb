class Pinouts < ActiveRecord::Migration
  def change
    create_table :pinouts do |t|
      t.references :pinoutable, polymorphic: true, index: true
      t.string :description, null: false
      t.string :pin_1
      t.string :pin_2
      t.string :pin_3
      t.string :pin_4
      t.string :pin_5
      t.string :pin_6
      t.string :pin_7
      t.string :pin_8
      t.string :pin_9
      t.string :identifier

      t.timestamps
    end
    add_index :pinouts, [:pinoutable_id, :pinoutable_type]
  end
end
