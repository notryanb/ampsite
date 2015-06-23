class Pinouts < ActiveRecord::Migration
  def change
    create_table :pinouts do |t|
      t.references :pinoutable, polymorphic: true, index: true
      t.string :description, null: false
      t.string :pin_1, default: "NC"
      t.string :pin_2, default: "NC"
      t.string :pin_3, default: "NC"
      t.string :pin_4, default: "NC"
      t.string :pin_5, default: "NC"
      t.string :pin_6, default: "NC"
      t.string :pin_7, default: "NC"
      t.string :pin_8, default: "NC"
      t.string :pin_9, default: "NC"

      t.timestamps
    end
  end
end
