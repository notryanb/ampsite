class Triodes < ActiveRecord::Migration
  def change
    create_table :triodes do |t|
      t.string :identifier, null: false
      t.string :classification, null: false
      t.float :filament_voltage, null: false
      t.float :filament_current, null: false
      t.float :max_anode_voltage, null: false
      t.float :anode_dissipation, null: false
      t.float :amplification_factor, null: false

      t.timestamps
    end
  end
end
