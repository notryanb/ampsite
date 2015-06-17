class Pentodes < ActiveRecord::Migration
  def change
    create_table :pentodes do |t|
      t.string :identifier, null: false
      t.string :classification, null: false
      t.integer :filament_voltage, null: false
      t.integer :filament_current, null: false
      t.integer :max_anode_voltage, null: false
      t.integer :anode_dissipation, null: false
      t.integer :max_grid2_voltage, null: false
      t.integer :max_grid2_dissipation, null: false
      t.integer :amplification_factor, null: false

      t.timestamps
    end
  end
end
