class Datasheets < ActiveRecord::Migration
  def change
    create_table :datasheets do |t|
      t.references :datasheetable, polymorphic: true, index: true
      t.string :url

      t.timestamps
    end
    add_index :datasheets, [:datasheetable_id, :datasheetable_type]
  end
end
