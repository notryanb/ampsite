class Pinouts < ActiveRecord::Migration
  def change
    create_table :pinouts do |t|
      t.references :pinoutable, polymorphic: true, index: true
      t.references :tubesocket

      t.timestamps
    end
    add_index :pinouts, [:pinoutable_id, :pinoutable_type]
  end
end
